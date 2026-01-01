import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.textStyle,
    this.width,
    this.height,
    this.color,
  });
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.toDouble().w ?? 150.w,
        height: height?.toDouble().h ?? 50.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: color ?? mainColor,
        ),
        child: Center(
          child: isLoading
              ? LottieBuilder.asset(
                  'assets/lottie/loading.json',
                )
              : Text(
                  text,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
