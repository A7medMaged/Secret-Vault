import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecretVault extends StatelessWidget {
  const SecretVault({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Secret Vault',
        home: Scaffold(
          body: Center(
            child: Text(
              'Secret Vault',
              style: TextStyle(fontSize: 24.sp),
            ),
          ),
        ),
      ),
    );
  }
}
