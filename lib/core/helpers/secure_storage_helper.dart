import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const _secureStorage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    try {
      if (kDebugMode) {
        debugPrint('FlutterSecureStorage : setSecuredString with key : $key');
      }
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint('❌ Error saving to secure storage: $e');
      rethrow;
    }
  }

  /// Gets a String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    try {
      if (kDebugMode) {
        debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
      }
      return await _secureStorage.read(key: key) ?? '';
    } catch (e) {
      debugPrint('❌ Error reading from secure storage: $e');
      return '';
    }
  }

  /// Deletes a specific key from FlutterSecureStorage
  static Future<void> deleteSecuredString(String key) async {
    try {
      if (kDebugMode) {
        debugPrint(
          'FlutterSecureStorage : deleteSecuredString with key : $key',
        );
      }
      await _secureStorage.delete(key: key);
    } catch (e) {
      debugPrint('❌ Error deleting from secure storage: $e');
      rethrow;
    }
  }

  /// Checks if a key exists in FlutterSecureStorage
  static Future<bool> containsKey(String key) async {
    try {
      return await _secureStorage.containsKey(key: key);
    } catch (e) {
      debugPrint('❌ Error checking key existence: $e');
      return false;
    }
  }

  /// Gets all keys from FlutterSecureStorage
  static Future<Map<String, String>> getAllSecuredData() async {
    try {
      return await _secureStorage.readAll();
    } catch (e) {
      debugPrint('❌ Error reading all data: $e');
      return {};
    }
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    try {
      if (kDebugMode) {
        debugPrint('FlutterSecureStorage : all data has been cleared');
      }
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint('❌ Error clearing secure storage: $e');
      rethrow;
    }
  }
}
