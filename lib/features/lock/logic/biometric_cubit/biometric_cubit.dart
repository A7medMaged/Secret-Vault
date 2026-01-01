import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_vault/features/lock/data/biometric_helper.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/features/lock/data/crypto_isolate.dart';
import 'package:secret_vault/features/lock/data/crypto_service.dart';
import 'package:secret_vault/features/lock/data/biometric_encrypt_helper.dart';
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';

part 'biometric_state.dart';
part 'biometric_cubit.freezed.dart';

class BiometricCubit extends Cubit<BiometricState> {
  BiometricCubit() : super(const BiometricState.initial()) {
    checkAvailability();
  }

  /// Check biometric availability
  Future<void> checkAvailability() async {
    emit(const BiometricState.checking());

    try {
      final isAvailable = await BiometricHelper.isAvailable();

      if (!isAvailable) {
        emit(const BiometricState.notAvailable());
        return;
      }

      final biometricType = await BiometricHelper.getBiometricTypeString();

      emit(
        BiometricState.available(
          isAvailable: true,
          biometricType: biometricType,
        ),
      );

      log('Biometric available: $biometricType');
    } catch (e) {
      log('Error checking biometric: $e');
      emit(BiometricState.error(message: e.toString()));
    }
  }

  /// Enable biometric authentication
  Future<bool> enableBiometric(String pin) async {
    try {
      log('Enabling biometric authentication...');

      final encryptedPin = await BiometricEncryptionHelper.encryptPin(pin);

      await SecureStorageHelper.setSecuredString(
        SecureStorageKeys.encryptedPinKey,
        encryptedPin,
      );

      await SecureStorageHelper.setSecuredString(
        SecureStorageKeys.biometricEnabledKey,
        'true',
      );

      log('Biometric enabled successfully');
      return true;
    } catch (e) {
      log('Error enabling biometric: $e');
      emit(const BiometricState.error(message: 'Failed to enable biometric'));
      return false;
    }
  }

  /// Disable biometric authentication
  Future<void> disableBiometric() async {
    try {
      await Future.wait([
        SecureStorageHelper.setSecuredString(
          SecureStorageKeys.encryptedPinKey,
          '',
        ),
        SecureStorageHelper.setSecuredString(
          SecureStorageKeys.biometricEnabledKey,
          'false',
        ),
        BiometricEncryptionHelper.clearKeys(),
      ]);

      log('Biometric disabled');
    } catch (e) {
      log('Error disabling biometric: $e');
    }
  }

  /// Check if biometric authentication is enabled
  Future<bool> isBiometricEnabled() async {
    final enabled = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.biometricEnabledKey,
    );
    return enabled == 'true';
  }

  /// Biometric authentication
  Future<BiometricAuthResult?> authenticate() async {
    emit(const BiometricState.authenticating());

    try {
      final isEnabled = await isBiometricEnabled();
      if (!isEnabled) {
        emit(
          const BiometricState.authenticationFailed(
            reason: 'Biometric not enabled',
          ),
        );
        return null;
      }

      final authenticated = await BiometricHelper.authenticate(
        reason: 'Unlock your secret vault',
      );

      if (!authenticated) {
        emit(
          const BiometricState.authenticationFailed(
            reason: 'Authentication cancelled',
          ),
        );
        return null;
      }

      final results = await Future.wait([
        SecureStorageHelper.getSecuredString(SecureStorageKeys.pinSalt),
        SecureStorageHelper.getSecuredString(SecureStorageKeys.encryptedPinKey),
      ]);

      final salt = results[0];
      final encryptedPin = results[1];

      if (salt.isEmpty || encryptedPin.isEmpty) {
        emit(
          const BiometricState.error(
            message: 'PIN data not found',
          ),
        );
        return null;
      }

      final pinString = await BiometricEncryptionHelper.decryptPin(
        encryptedPin,
      );

      final masterKey = await compute(
        deriveKeyIsolate,
        DeriveParams(pinString, salt),
      );

      final sessionKey = CryptoService.generateSessionKey();

      emit(const BiometricState.authenticated());

      return BiometricAuthResult(
        masterKey: masterKey,
        sessionKey: sessionKey,
      );
    } catch (e, stackTrace) {
      log('Biometric authentication error: $e');
      log('Stack trace: $stackTrace');
      emit(BiometricState.error(message: e.toString()));
      return null;
    }
  }

  /// Refresh biometric state
  Future<void> refresh() async {
    await checkAvailability();
  }

  Future<void> autoAuthenticateIfEnabled() async {
    final enabled = await isBiometricEnabled();
    if (!enabled) return;

    if (state is Authenticating) return;

    emit(const BiometricState.authenticating());

    await Future.delayed(const Duration(milliseconds: 300));

    final result = await authenticate();

    if (result != null) {
      emit(const BiometricState.authenticated());
    } else {
      emit(
        const BiometricState.available(
          isAvailable: true,
          biometricType: 'Fingerprint',
        ),
      );
    }
  }
}

/// Biometric authentication result
class BiometricAuthResult {
  final Uint8List masterKey;
  final Uint8List sessionKey;

  BiometricAuthResult({
    required this.masterKey,
    required this.sessionKey,
  });
}
