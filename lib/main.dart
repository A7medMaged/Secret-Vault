import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secret_vault/core/routing/app_router.dart';
import 'package:secret_vault/secret_vault.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    SecretVault(
      appRouter: AppRouter(),
    ),
  );
}
