import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_vault/core/helpers/app_boot.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/features/lock/data/crypto_isolate.dart';
import 'package:secret_vault/features/lock/data/crypto_service.dart';
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';

part 'pin_state.dart';
part 'pin_cubit.freezed.dart';

class PinCubit extends Cubit<PinState> {
  static const int pinLength = 4;
  List<int>? firstPin;
  static const int maxAttempts = 3;
  static const int lockDuration = 60;
  int attempts = 0;
  Timer? lockTimer;
  int secondsLeft = 0;
  PinCubit() : super(const PinState.pinInitial());

  void onNumberPressed(int number, {required bool creating}) {
    if (state is PinLocked) return;

    state.maybeWhen(
      pinEntering: (pin) => addDigit(pin, number, creating),
      pinConfirming: (pin) => addDigit(pin, number, creating),
      pinInitial: () => addDigit([], number, creating),
      orElse: () {},
    );
  }

  void addDigit(List<int> current, int number, bool creating) {
    if (current.length >= pinLength) return;

    final updated = [...current, number];

    state.maybeWhen(
      pinConfirming: (_) {
        emit(PinState.pinConfirming(updated));
      },
      orElse: () {
        emit(PinState.pinEntering(updated));
      },
    );

    if (updated.length == pinLength) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        creating ? handleCreate(updated) : handleValidate(updated);
      });
    }
  }

  void onDeletePressed() {
    if (state is PinLocked) return;

    state.maybeWhen(
      pinEntering: (pin) {
        if (pin.isEmpty) return;
        emit(PinState.pinEntering(pin.sublist(0, pin.length - 1)));
      },
      pinConfirming: (pin) {
        if (pin.isEmpty) return;
        emit(PinState.pinConfirming(pin.sublist(0, pin.length - 1)));
      },
      orElse: () {},
    );
  }

  Future<void> handleCreate(List<int> pin) async {
    try {
      if (firstPin == null) {
        firstPin = pin;
        emit(const PinState.pinConfirming([]));
        return;
      }

      if (firstPin!.join() != pin.join()) {
        firstPin = null;
        emit(const PinState.pinError('PINs do not match'));
        await Future.delayed(const Duration(milliseconds: 800));
        emit(const PinState.pinInitial());
        return;
      }

      final pinString = pin.join();
      final salt = CryptoService.generateSalt();

      log('Creating PIN...');

      final hash = await compute(
        hashPinIsolate,
        HashParams(pinString, salt),
      );

      log('Saving to storage...');

      await Future.wait([
        SecureStorageHelper.setSecuredString(SecureStorageKeys.pinSalt, salt),
        SecureStorageHelper.setSecuredString(SecureStorageKeys.pinHash, hash),
      ]);

      log('Deriving key...');

      final masterKey = await compute(
        deriveKeyIsolate,
        DeriveParams(pinString, salt),
      );

      final sessionKey = CryptoService.generateSessionKey();

      SessionKeys.masterKey = masterKey;
      SessionKeys.sessionKey = sessionKey;

      log('PIN created successfully');

      emit(const PinState.pinSuccess());
      AppBoot.hasPin = true;
    } catch (e, stackTrace) {
      log('Error creating PIN: $e');
      log('Stack trace: $stackTrace');
      emit(PinState.pinError('Error: $e'));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(const PinState.pinInitial());
    }
  }

  Future<void> handleValidate(List<int> pin) async {
    try {
      final pinString = pin.join();

      log('Validating PIN...');

      final results = await Future.wait([
        SecureStorageHelper.getSecuredString(SecureStorageKeys.pinSalt),
        SecureStorageHelper.getSecuredString(SecureStorageKeys.pinHash),
      ]);

      final salt = results[0];
      final savedHash = results[1];

      log('Salt: ${salt.isNotEmpty ? "Found" : "Empty"}');
      log('Hash: ${savedHash.isNotEmpty ? "Found" : "Empty"}');

      if (salt.isEmpty || savedHash.isEmpty) {
        emit(const PinState.pinError('No PIN found'));
        return;
      }

      log('Hashing input...');

      final inputHash = await compute(
        hashPinIsolate,
        HashParams(pinString, salt),
      );

      log('Comparing hashes...');

      if (inputHash == savedHash) {
        log('PIN correct!');

        attempts = 0;

        final masterKey = await compute(
          deriveKeyIsolate,
          DeriveParams(pinString, salt),
        );

        final sessionKey = CryptoService.generateSessionKey();

        SessionKeys.masterKey = masterKey;
        SessionKeys.sessionKey = sessionKey;

        emit(const PinState.pinSuccess());
        AppBoot.hasPin = true;
      } else {
        log('PIN incorrect');

        attempts++;
        if (attempts >= maxAttempts) {
          startLockout();
        } else {
          emit(const PinState.pinError('Incorrect PIN'));
          await Future.delayed(const Duration(milliseconds: 800));
          emit(const PinState.pinInitial());
        }
      }
    } catch (e, stackTrace) {
      log('Error validating PIN: $e');
      log('Stack trace: $stackTrace');
      emit(PinState.pinError('Error: $e'));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(const PinState.pinInitial());
    }
  }

  Future<void> resetAttempts() async {
    attempts = 0;
    await Future.wait([
      SecureStorageHelper.setSecuredString(SecureStorageKeys.attemptsKey, '0'),
      SecureStorageHelper.setSecuredString(SecureStorageKeys.lockUntilKey, ''),
    ]);
  }

  Future<void> saveLockTime() async {
    final lockUntil = DateTime.now().add(const Duration(seconds: lockDuration));
    await SecureStorageHelper.setSecuredString(
      SecureStorageKeys.lockUntilKey,
      lockUntil.toIso8601String(),
    );
  }

  void startLockout({bool resuming = false}) {
    if (!resuming) {
      secondsLeft = lockDuration;
    }

    emit(PinState.pinLocked(secondsLeft));

    lockTimer?.cancel();
    lockTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsLeft--;

        if (secondsLeft <= 0) {
          timer.cancel();
          resetAttempts();
          emit(const PinState.pinInitial());
        } else {
          emit(PinState.pinLocked(secondsLeft));
        }
      },
    );
  }

  @override
  Future<void> close() {
    lockTimer?.cancel();
    return super.close();
  }

  Future<bool> verifyPin(String inputPin) async {
    final salt = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinSalt,
    );
    final savedHash = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinHash,
    );

    if (salt.isEmpty || savedHash.isEmpty) return false;

    final inputHash = CryptoService.hashPinWithPBKDF2(
      pin: inputPin,
      salt: salt,
    );

    return inputHash == savedHash;
  }
}
