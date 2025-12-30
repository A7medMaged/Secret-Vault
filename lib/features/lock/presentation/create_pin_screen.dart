// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/helpers/spacing.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/features/lock/presentation/widgets/dots.dart';
import 'package:secret_vault/features/lock/presentation/widgets/key_pad.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.lock,
                size: 36.sp,
                color: mainColor,
              ),
            ),
            verticalSpace(20),
            Text(
              'Create PIN',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(8),
            Text(
              'Create a secure PIN to protect your vault',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            const Spacer(),
            const Dots(),
            verticalSpace(24),
            const Keypad(),
            const Spacer(),
            Padding(
              padding: .only(bottom: 16.h),
              child: Text(
                'You will need this PIN to unlock the app',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
