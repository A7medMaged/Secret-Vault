import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';

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
