import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/helpers/spacing.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/features/lock/presentation/widgets/biometric_bloc_listener.dart';
import 'package:secret_vault/features/lock/presentation/widgets/dots_bloc_builder.dart';
import 'package:secret_vault/features/lock/presentation/widgets/key_pad.dart';
import 'package:secret_vault/features/lock/presentation/widgets/lockout_bloc_builder.dart';
import 'package:secret_vault/features/lock/presentation/widgets/logo.dart';
import 'package:secret_vault/features/lock/presentation/widgets/pin_bloc_listener.dart';

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
              const Logo(),
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
              const DotsBlocBuilder(),
              const LockoutBlocBuilder(),
              verticalSpace(24),
              const Keypad(creating: false),
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
              const PinBlocListener(),
              const BiometricBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
