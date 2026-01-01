import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secret_vault/core/helpers/app_boot.dart';
import 'package:secret_vault/core/observer/app_lifecycle_observer.dart';
import 'package:secret_vault/core/routing/app_router.dart';
import 'package:secret_vault/secret_vault.dart';

late final AppLifecycleObserver appLifecycleObserver;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appLifecycleObserver = AppLifecycleObserver(AppRouter.router);
  WidgetsBinding.instance.addObserver(appLifecycleObserver);
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
