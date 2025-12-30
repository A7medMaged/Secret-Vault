import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secret_vault/core/helpers/app_boot.dart';
import 'package:secret_vault/core/routing/app_router.dart';
import 'package:secret_vault/secret_vault.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    AppBoot.init(),
  ]);
  runApp(
    SecretVault(
      appRouter: AppRouter(),
    ),
  );
}
