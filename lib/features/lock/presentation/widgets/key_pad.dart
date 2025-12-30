import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/core/theming/colors.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row(['1', '2', '3']),
        _row(['4', '5', '6']),
        _row(['7', '8', '9']),
        Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            _iconButton(Icons.fingerprint),
            _numberButton('0'),
            _iconButton(Icons.backspace_outlined),
          ],
        ),
      ],
    );
  }

  Widget _row(List<String> numbers) {
    return Padding(
      padding: .symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: numbers.map(_numberButton).toList(),
      ),
    );
  }

  Widget _numberButton(String number) {
    return _KeyButton(
      child: Text(
        number,
        style: TextStyle(
          fontSize: 22.sp,
          color: white,
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return _KeyButton(
      child: Icon(
        icon,
        color: mainColor,
        size: 24.sp,
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final Widget child;
  const _KeyButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 64.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: .circular(32.r),
          onTap: () {
            context.pushReplacement(AppRoutes.homeScreen);
          },
          child: Center(child: child),
        ),
      ),
    );
  }
}
