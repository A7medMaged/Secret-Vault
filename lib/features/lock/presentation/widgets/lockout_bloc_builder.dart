import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';

class LockoutBlocBuilder extends StatelessWidget {
  const LockoutBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.maybeWhen(
            pinLocked: (seconds) => Padding(
              padding: .only(top: 12.h),
              child: Text(
                'Too many attempts. Try again in $seconds seconds',
                key: ValueKey(seconds),
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.redAccent,
                ),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
