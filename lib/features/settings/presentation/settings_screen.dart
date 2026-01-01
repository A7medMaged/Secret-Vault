import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/core/theming/text_styles.dart';
import 'package:secret_vault/core/widgets/app_text_button.dart';
import 'package:secret_vault/core/widgets/app_text_form_field.dart';
import 'package:secret_vault/features/lock/logic/biometric_cubit/biometric_cubit.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Security',
          style: TextStyles.font24mainBold,
        ),
      ),
      body: BlocBuilder<BiometricCubit, BiometricState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),

            checking: () => const Center(
              child: CircularProgressIndicator(),
            ),

            notAvailable: () => _notAvailable(),

            available: (isAvailable, biometricType) {
              return _biometricTile(
                context,
                biometricType,
              );
            },

            authenticating: () => _loadingTile(),

            authenticated: () => _successTile(),

            authenticationFailed: (reason) => _errorTile(reason),

            error: (message) => _errorTile(message),
          );
        },
      ),
    );
  }

  Widget _notAvailable() {
    return const ListTile(
      leading: Icon(Icons.fingerprint, color: Colors.grey),
      title: Text('Biometric not available'),
      subtitle: Text('Your device does not support biometrics'),
    );
  }

  Widget _biometricTile(
    BuildContext context,
    String biometricType,
  ) {
    return FutureBuilder<bool>(
      future: context.read<BiometricCubit>().isBiometricEnabled(),
      builder: (context, snapshot) {
        final enabled = snapshot.data ?? false;

        return SwitchListTile(
          secondary: const Icon(Icons.fingerprint),
          title: Text(
            'Unlock with $biometricType',
            style: TextStyles.font16Regular,
          ),
          subtitle: Text(
            'Use biometric authentication to unlock the vault',
            style: TextStyles.font16Regular,
          ),
          value: enabled,
          activeThumbColor: mainColor,
          onChanged: (value) async {
            if (value) {
              _enableBiometricFlow(context);
            } else {
              await context.read<BiometricCubit>().disableBiometric();
              if (context.mounted) {
                context.read<BiometricCubit>().refresh();
              }
            }
          },
        );
      },
    );
  }

  Widget _loadingTile() {
    return const ListTile(
      leading: CircularProgressIndicator(),
      title: Text('Authenticating...'),
    );
  }

  Widget _successTile() {
    return const ListTile(
      leading: Icon(Icons.check_circle, color: Colors.green),
      title: Text('Biometric enabled'),
    );
  }

  Widget _errorTile(String message) {
    return ListTile(
      leading: const Icon(Icons.error, color: Colors.red),
      title: Text(message),
    );
  }

  Future<void> _enableBiometricFlow(BuildContext context) async {
    final pin = await _askForPin(context);

    if (pin == null) return;

    if (!context.mounted) return;
    final cubit = context.read<BiometricCubit>();

    final success = await cubit.enableBiometric(pin);

    if (!context.mounted) return;

    if (success) {
      cubit.refresh();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Biometric enabled successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to enable biometric'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<String?> _askForPin(BuildContext context) async {
    final controller = TextEditingController();

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text('Confirm PIN'),
          backgroundColor: scaffoldColor,
          content: AppTextFormField(
            controller: controller,
            isObscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 4,
            hintText: 'Enter your PIN',
            hintStyle: TextStyles.font16Regular,
            backgroundColor: Colors.transparent,
          ),

          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: white),
              ),
            ),
            AppTextButton(
              text: 'Confirm',
              width: 100.w,
              color: secondaryColor,
              textStyle: TextStyles.font16Regular.copyWith(color: mainColor),
              onTap: () async {
                if (controller.text.length != 4) return;

                final isValid = await context.read<PinCubit>().verifyPin(
                  controller.text,
                );

                if (!context.mounted) return;

                if (isValid) {
                  context.pop(controller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incorrect PIN'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
