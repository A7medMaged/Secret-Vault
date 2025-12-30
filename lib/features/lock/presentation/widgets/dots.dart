import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';

class Dots extends StatelessWidget {
  final int filled;
  final int length;
  const Dots({super.key, required this.filled, this.length = 4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isFilled = index < filled;
        return Container(
          margin: .symmetric(horizontal: 6.w),
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? mainColor : Colors.transparent,
            border: Border.all(
              color: isFilled ? mainColor : Colors.white30,
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }
}
