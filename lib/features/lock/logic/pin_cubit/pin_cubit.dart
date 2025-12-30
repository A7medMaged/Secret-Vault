import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/helpers/crypto_service.dart';
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

  void onNumberPressed(
    int number, {
    required bool creating,
  }) {
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
      creating ? handleCreate(updated) : handleValidate(updated);
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
    if (firstPin == null) {
      firstPin = pin;
      emit(const PinState.pinConfirming([]));
      return;
    }

    if (firstPin!.join() != pin.join()) {
      firstPin = null;
      emit(const PinState.pinError('PINs do not match'));
      emit(const PinState.pinInitial());
      return;
    }

    final pinString = pin.join();

    final salt = CryptoService.generateSalt();

    final hash = CryptoService.hashPin(
      pin: pinString,
      salt: salt,
    );

    await SecureStorageHelper.setSecuredString(
      SecureStorageKeys.pinSalt,
      salt,
    );
    await SecureStorageHelper.setSecuredString(
      SecureStorageKeys.pinHash,
      hash,
    );

    SessionKeys.vaultKey = CryptoService.deriveKey(
      pin: pinString,
      salt: salt,
    );

    emit(const PinState.pinSuccess());
  }

  Future<void> handleValidate(List<int> pin) async {
    final pinString = pin.join();

    final salt = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinSalt,
    );
    final savedHash = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinHash,
    );

    final inputHash = CryptoService.hashPin(
      pin: pinString,
      salt: salt,
    );

    if (inputHash == savedHash) {
      attempts = 0;

      SessionKeys.vaultKey = CryptoService.deriveKey(
        pin: pinString,
        salt: salt,
      );

      emit(const PinState.pinSuccess());
    } else {
      attempts++;
      if (attempts >= maxAttempts) {
        startLockout();
      } else {
        emit(const PinState.pinError('Incorrect PIN'));
        emit(const PinState.pinInitial());
      }
    }
  }

  void startLockout() {
    secondsLeft = lockDuration;
    emit(PinState.pinLocked(secondsLeft));

    lockTimer?.cancel();
    lockTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsLeft--;

        if (secondsLeft <= 0) {
          timer.cancel();
          attempts = 0;
          emit(const PinState.pinInitial());
        } else {
          emit(PinState.pinLocked(secondsLeft));
        }
      },
    );
  }
}
