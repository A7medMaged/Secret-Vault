import 'dart:typed_data';
import 'package:secret_vault/features/lock/data/crypto_service.dart';

class DeriveParams {
  final String pin;
  final String salt;
  DeriveParams(this.pin, this.salt);
}

Uint8List deriveKeyIsolate(DeriveParams params) {
  return CryptoService.deriveKey(
    pin: params.pin,
    salt: params.salt,
  );
}

class HashParams {
  final String pin;
  final String salt;
  HashParams(this.pin, this.salt);
}

String hashPinIsolate(HashParams params) {
  return CryptoService.hashPinWithPBKDF2(
    pin: params.pin,
    salt: params.salt,
  );
}
