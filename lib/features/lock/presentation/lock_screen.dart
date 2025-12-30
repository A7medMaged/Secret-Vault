import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/helpers/spacing.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/features/lock/presentation/widgets/dots.dart';
import 'package:secret_vault/features/lock/presentation/widgets/key_pad.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 75.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.lock,
                  color: mainColor,
                  size: 36.sp,
                ),
              ),
              verticalSpace(16),
              Text(
                'Secret Vault',
                style: TextStyle(fontSize: 24.sp),
              ),
              verticalSpace(4),
              Text(
                'Enter PIN to unlock',
                style: TextStyle(fontSize: 12.sp, color: grey),
              ),
              verticalSpace(24),
              const Dots(),
              verticalSpace(24),
              const Keypad(),
              verticalSpace(48),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot PIN?',
                  style: TextStyle(
                    color: lightGray,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
