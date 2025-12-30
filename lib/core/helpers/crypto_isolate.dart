import 'dart:typed_data';
import 'package:secret_vault/core/helpers/crypto_service.dart';

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
