// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_vault/core/helpers/spacing.dart';
import 'package:secret_vault/core/theming/text_styles.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';

class TextCreateBlocBuilder extends StatelessWidget {
  const TextCreateBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      builder: (context, state) {
        final isConfirming = state.maybeWhen(
          pinConfirming: (_) => true,
          orElse: () => false,
        );

        return Column(
          children: [
            Text(
              'Create PIN',
              style: TextStyles.font24mainBold,
            ),
            verticalSpace(8),
            Text(
              isConfirming
                  ? 'Re-enter your PIN to confirm'
                  : 'Create a secure PIN to protect your vault',
              textAlign: TextAlign.center,
              style: TextStyles.font14LightGreyRegular.copyWith(
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ],
        );
      },
    );
  }
}
