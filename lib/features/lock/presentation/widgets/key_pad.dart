import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/features/lock/logic/biometric_cubit/biometric_cubit.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';
import 'package:secret_vault/features/lock/presentation/widgets/key_button.dart';

class Keypad extends StatelessWidget {
  final bool creating;

  const Keypad({
    super.key,
    required this.creating,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      builder: (context, state) {
        final isLocked = state.maybeWhen(
          pinLocked: (_) => true,
          orElse: () => false,
        );
        return IgnorePointer(
          ignoring: isLocked,
          child: Opacity(
            opacity: isLocked ? 0.4 : 1,
            child: Column(
              children: [
                row(context, ['1', '2', '3']),
                row(context, ['4', '5', '6']),
                row(context, ['7', '8', '9']),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    if (!creating) fingerprintButton(context),
                    if (creating) SizedBox(width: 64.w, height: 64.h),
                    numberButton(context, '0'),
                    deleteButton(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget row(BuildContext context, List<String> numbers) {
    return Padding(
      padding: .symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers
            .map((number) => numberButton(context, number))
            .toList(),
      ),
    );
  }

  Widget numberButton(BuildContext context, String number) {
    return KeyButton(
      child: Text(
        number,
        style: TextStyle(
          fontSize: 22.sp,
          color: white,
        ),
      ),
      onTap: () {
        context.read<PinCubit>().onNumberPressed(
          int.parse(number),
          creating: creating,
        );
      },
    );
  }

  Widget deleteButton(BuildContext context) {
    return KeyButton(
      child: Icon(
        Icons.backspace_outlined,
        color: mainColor,
        size: 24.sp,
      ),
      onTap: () {
        context.read<PinCubit>().onDeletePressed();
      },
    );
  }

  Widget fingerprintButton(BuildContext context) {
    return BlocBuilder<BiometricCubit, BiometricState>(
      builder: (context, state) {
        final isAvailable = state.maybeWhen(
          available: (_, _) => true,
          orElse: () => false,
        );

        if (!isAvailable) {
          return SizedBox(width: 64.w, height: 64.h);
        }

        final isLoading = state.maybeWhen(
          authenticating: () => true,
          orElse: () => false,
        );

        return KeyButton(
          onTap: isLoading ? () {} : () => _handleBiometricAuth(context),
          child: isLoading ? _buildLoadingIndicator() : _buildFingerprintIcon(),
        );
      },
    );
  }

  /// Handle biometric authentication flow
  Future<void> _handleBiometricAuth(BuildContext context) async {
    final bioCubit = context.read<BiometricCubit>();

    // Attempt authentication (cubit will check if enabled internally)
    final result = await bioCubit.authenticate();

    if (!context.mounted) return;

    // Handle authentication result
    if (result != null) {
      SessionKeys.masterKey = result.masterKey;
      SessionKeys.sessionKey = result.sessionKey;
      context.pushReplacement(AppRoutes.homeScreen);
    } else {
      // Check the current state to determine the error message
      final state = bioCubit.state;
      state.maybeWhen(
        authenticationFailed: (reason) {
          if (reason == 'Biometric not enabled') {
            _showBiometricNotEnabledMessage(context);
          } else {
            _showAuthenticationFailedMessage(context);
          }
        },
        orElse: () => _showAuthenticationFailedMessage(context),
      );
    }
  }

  /// Show message when biometric is not enabled
  void _showBiometricNotEnabledMessage(BuildContext context) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enable biometric in settings first'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Show message when authentication fails
  void _showAuthenticationFailedMessage(BuildContext context) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Authentication failed'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Build loading indicator widget
  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(mainColor),
      ),
    );
  }

  /// Build fingerprint icon widget
  Widget _buildFingerprintIcon() {
    return Icon(
      Icons.fingerprint,
      color: mainColor,
      size: 24.sp,
    );
  }
}
