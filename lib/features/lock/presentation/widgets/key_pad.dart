import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fingerprintButton(),
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

  Widget fingerprintButton() {
    return KeyButton(
      child: Icon(
        Icons.fingerprint,
        color: mainColor,
        size: 24.sp,
      ),
      onTap: () {},
    );
  }
}

class KeyButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const KeyButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 64.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: .circular(32.r),
          onTap: onTap,
          child: Center(child: child),
        ),
      ),
    );
  }
}
