import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';

class AppBoot {
  static bool hasPin = false;

  static Future<void> init() async {
    final hash = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinHash,
    );

    hasPin = hash.isNotEmpty;
  }
}
