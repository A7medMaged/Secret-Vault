import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';
import 'package:secret_vault/features/lock/presentation/widgets/dots.dart';

class DotsBlocBuilder extends StatelessWidget {
  const DotsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      builder: (context, state) {
        final filled = state.maybeWhen(
          pinEntering: (pin) => pin.length,
          pinConfirming: (pin) => pin.length,
          orElse: () => 0,
        );

        return Dots(filled: filled);
      },
    );
  }
}
