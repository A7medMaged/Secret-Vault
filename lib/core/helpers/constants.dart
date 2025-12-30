import 'dart:typed_data';

class SecureStorageKeys {
  static const String pinSalt = 'pin_salt';
  static const pinHash = 'pin_hash';
  static const String lockUntilKey = 'lock_until';
}

class SessionKeys {
  static Uint8List? vaultKey;

  static bool get hasKey => vaultKey != null;

  static void clear() {
    vaultKey = null;
  }
}
