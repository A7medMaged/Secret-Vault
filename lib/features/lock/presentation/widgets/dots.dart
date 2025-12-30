import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final filled = index < 2;
        return Container(
          margin: .symmetric(horizontal: 6.w),
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? mainColor : Colors.transparent,
            border: Border.all(
              color: filled ? mainColor : Colors.white30,
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }
}
