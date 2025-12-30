// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/helpers/spacing.dart';
import 'package:secret_vault/features/lock/presentation/widgets/dots_bloc_builder.dart';
import 'package:secret_vault/features/lock/presentation/widgets/key_pad.dart';
import 'package:secret_vault/features/lock/presentation/widgets/logo.dart';
import 'package:secret_vault/features/lock/presentation/widgets/pin_bloc_listener.dart';
import 'package:secret_vault/features/lock/presentation/widgets/text_create_bloc_builder.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const Logo(),
            verticalSpace(20),
            const TextCreateBlocBuilder(),
            const Spacer(),
            const DotsBlocBuilder(),
            verticalSpace(24),
            const Keypad(creating: true),
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
            const Spacer(),
            const PinBlocListener(),
          ],
        ),
      ),
    );
  }
}
