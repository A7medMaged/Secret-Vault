import 'package:flutter/foundation.dart';
import 'package:secret_vault/core/helpers/crypto_service.dart';

class SecureStorageKeys {
  static const String pinSalt = 'pin_salt';
  static const pinHash = 'pin_hash';
  static const String lockUntilKey = 'lock_until';
  static const String attemptsKey = 'attempts';
  static const String encryptedPinKey = 'encrypted_pin';
  static const String biometricEnabledKey = 'biometric_enabled';
  static const String biometricTypeKey = 'biometric_type';
}

class SessionKeys {
  static Uint8List? masterKey;
  static Uint8List? sessionKey;

  static Future<Uint8List?> getMasterKey(String pin, String salt) async {
    final masterKey = CryptoService.deriveKey(
      pin: pin,
      salt: salt,
    );
    return masterKey;
  }

  static bool get hasSession => sessionKey != null;

  static void clear() {
    masterKey = null;
    sessionKey = null;
  }
}
