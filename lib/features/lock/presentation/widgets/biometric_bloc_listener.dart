import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/features/lock/logic/biometric_cubit/biometric_cubit.dart';

class BiometricBlocListener extends StatefulWidget {
  const BiometricBlocListener({super.key});

  @override
  State<BiometricBlocListener> createState() => _BiometricBlocListenerState();
}

class _BiometricBlocListenerState extends State<BiometricBlocListener> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BiometricCubit>().autoAuthenticateIfEnabled();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BiometricCubit, BiometricState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: () {
            context.pushReplacement(AppRoutes.homeScreen);
          },
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
