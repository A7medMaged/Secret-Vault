import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';

/// Helper class for encrypting/decrypting PIN for biometric authentication
class BiometricEncryptionHelper {
  // Private constructor
  BiometricEncryptionHelper._();

  // Storage keys
  static const String _keyStorageKey = 'biometric_encryption_key';
  static const String _ivStorageKey = 'biometric_encryption_iv';

  /// Encrypt PIN using AES-256
  static Future<String> encryptPin(String pin) async {
    final key = await _getOrCreateEncryptionKey();
    final iv = await _getOrCreateIV();

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(pin, iv: iv);

    return encrypted.base64;
  }

  /// Decrypt PIN using AES-256
  static Future<String> decryptPin(String encryptedPin) async {
    final key = await _getOrCreateEncryptionKey();
    final iv = await _getOrCreateIV();

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypt.Encrypted.fromBase64(encryptedPin);

    return encrypter.decrypt(encrypted, iv: iv);
  }

  /// Clear encryption keys (call when disabling biometric)
  static Future<void> clearKeys() async {
    await Future.wait([
      SecureStorageHelper.setSecuredString(_keyStorageKey, ''),
      SecureStorageHelper.setSecuredString(_ivStorageKey, ''),
    ]);
  }

  /// Get or create encryption key (AES-256 = 32 bytes)
  static Future<encrypt.Key> _getOrCreateEncryptionKey() async {
    String? keyString = await SecureStorageHelper.getSecuredString(
      _keyStorageKey,
    );

    if (keyString.isEmpty) {
      // Generate new random key
      final key = encrypt.Key.fromSecureRandom(32); // 256 bits
      keyString = base64Encode(key.bytes);

      await SecureStorageHelper.setSecuredString(
        _keyStorageKey,
        keyString,
      );

      return key;
    }

    return encrypt.Key(base64Decode(keyString));
  }

  /// Get or create IV (Initialization Vector = 16 bytes)
  static Future<encrypt.IV> _getOrCreateIV() async {
    String? ivString = await SecureStorageHelper.getSecuredString(
      _ivStorageKey,
    );

    if (ivString.isEmpty) {
      // Generate new random IV
      final iv = encrypt.IV.fromSecureRandom(16); // 128 bits
      ivString = base64Encode(iv.bytes);

      await SecureStorageHelper.setSecuredString(
        _ivStorageKey,
        ivString,
      );

      return iv;
    }

    return encrypt.IV(base64Decode(ivString));
  }

  /// Check if encryption keys exist
  static Future<bool> hasEncryptionKeys() async {
    final results = await Future.wait([
      SecureStorageHelper.getSecuredString(_keyStorageKey),
      SecureStorageHelper.getSecuredString(_ivStorageKey),
    ]);

    return results[0].isNotEmpty && results[1].isNotEmpty;
  }
}
