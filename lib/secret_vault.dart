import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secret_vault/core/routing/app_router.dart';
import 'package:secret_vault/core/theming/colors.dart';

class SecretVault extends StatelessWidget {
  final AppRouter appRouter;
  const SecretVault({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Secret Vault',
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: scaffoldColor,
        ),
      ),
    );
  }
}
