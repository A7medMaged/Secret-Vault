import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';

class PinBlocListener extends StatelessWidget {
  const PinBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PinCubit, PinState>(
      listenWhen: (previous, current) =>
          current is PinSuccess || current is PinError,
      listener: (context, state) {
        state.whenOrNull(
          pinSuccess: () => context.pushReplacement(AppRoutes.homeScreen),
          pinError: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
