import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.lock,
        size: 36.sp,
        color: mainColor,
      ),
    );
  }
}
