import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptoService {
  /// Generate random salt 
  static String generateSalt({int length = 16}) {
    final random = Random.secure();
    final bytes =
        List<int>.generate(length, (_) => random.nextInt(256));
    return base64Encode(bytes);
  }

  /// Hash PIN + Salt
  static String hashPin({
    required String pin,
    required String salt,
  }) {
    final data = utf8.encode(pin + salt);
    final digest = sha256.convert(data);
    return digest.toString();
  }
}
