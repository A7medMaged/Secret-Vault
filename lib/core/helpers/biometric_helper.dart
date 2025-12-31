import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricHelper {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Check if biometric authentication is available
  static Future<bool> isAvailable() async {
    try {
      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();
      return canCheck && isDeviceSupported;
    } catch (e) {
      return false;
    }
  }

  /// Get available biometric types (fingerprint, face, iris)
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Authenticate using biometric
  static Future<bool> authenticate({
    String reason = 'Authenticate to unlock vault',
    int retryCount = 0,
  }) async {
    try {
      final bool isAvailable = await BiometricHelper.isAvailable();

      if (!isAvailable) {
        return false;
      }

      // Small delay only on first attempt to ensure UI is ready
      if (retryCount == 0) {
        await Future.delayed(const Duration(milliseconds: 100));
      }

      return await _auth.authenticate(
        localizedReason: reason,
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Biometric Authentication',
            cancelButton: 'Use PIN instead',
          ),
          IOSAuthMessages(
            cancelButton: 'Use PIN instead',
          ),
        ],
      );
    } on LocalAuthException catch (e) {
      debugPrint('LocalAuthException: ${e.code}');

      if (e.code == LocalAuthExceptionCode.uiUnavailable && retryCount < 2) {
        // Retry with a slightly longer delay if UI is not available
        debugPrint('⏳ UI not ready, retrying... (attempt ${retryCount + 1})');
        await Future.delayed(const Duration(milliseconds: 200));
        return authenticate(reason: reason, retryCount: retryCount + 1);
      } else if (e.code == LocalAuthExceptionCode.uiUnavailable) {
        debugPrint('❌ UI not available for biometric authentication');
        return false;
      } else if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
        debugPrint('❌ No biometric hardware');
        return false;
      } else if (e.code == LocalAuthExceptionCode.temporaryLockout ||
          e.code == LocalAuthExceptionCode.biometricLockout) {
        debugPrint('❌ Biometric locked out');
        return false;
      } else {
        debugPrint('❌ Other error: $e');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Unexpected error: $e');
      return false;
    }
  }

  /// Get biometric type string
  static Future<String> getBiometricTypeString() async {
    final biometrics = await getAvailableBiometrics();

    if (biometrics.isEmpty) return 'None';

    if (biometrics.contains(BiometricType.face)) {
      return 'Face ID';
    } else if (biometrics.contains(BiometricType.fingerprint)) {
      return 'Fingerprint';
    } else if (biometrics.contains(BiometricType.iris)) {
      return 'Iris';
    }

    return 'Biometric';
  }
}
