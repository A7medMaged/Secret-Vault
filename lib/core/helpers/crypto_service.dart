import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';

class CryptoService {
  /// Generate random salt
  static String generateSalt({int length = 32}) {
    final random = Random.secure();
    final bytes = List<int>.generate(length, (_) => random.nextInt(256));
    return base64Encode(bytes);
  }

  static String hashPinWithPBKDF2({
    required String pin,
    required String salt,
    int iterations = kReleaseMode ? 100000 : 5000,
    int keyLength = 32,
  }) {
    final derivator = PBKDF2KeyDerivator(
      HMac(SHA256Digest(), 64),
    );

    derivator.init(
      Pbkdf2Parameters(
        utf8.encode(salt),
        iterations,
        keyLength,
      ),
    );

    final hash = derivator.process(utf8.encode(pin));
    return base64Encode(hash);
  }

  @Deprecated('Use hashPinWithPBKDF2 instead')
  static String hashPin({
    required String pin,
    required String salt,
  }) {
    final data = utf8.encode(pin + salt);
    final digest = sha256.convert(data);
    return digest.toString();
  }

  static Uint8List deriveKey({
    required String pin,
    required String salt,
    int iterations = kReleaseMode ? 100000 : 5000,
    int keyLength = 32,
  }) {
    final derivator = PBKDF2KeyDerivator(
      HMac(SHA256Digest(), 64),
    );

    derivator.init(
      Pbkdf2Parameters(
        utf8.encode(salt),
        iterations,
        keyLength,
      ),
    );

    return derivator.process(utf8.encode(pin));
  }

  static Uint8List generateSessionKey({int length = 32}) {
    final random = Random.secure();
    return Uint8List.fromList(
      List<int>.generate(length, (_) => random.nextInt(256)),
    );
  }
}
