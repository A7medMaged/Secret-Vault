import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/core/theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final bool enabled;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.keyboardType,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      cursorColor: black,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.done,
      style: inputTextStyle ?? TextStyles.font14LightGreyRegular,
      decoration: InputDecoration(
        suffixIconColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.focused) ? mainColor : lightGray,
        ),
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.focused) ? mainColor : lightGray,
        ),
        isDense: true,
        contentPadding:
            contentPadding ?? .symmetric(horizontal: 20.w, vertical: 18.h),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightGray, width: 1.3.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
                width: 1.3.w,
              ),
              borderRadius: .circular(16.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: grey, width: 1.3.w),
              borderRadius: .circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3.w),
          borderRadius: .circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: .circular(16.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
        hintText: hintText ?? '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      validator: validator,
    );
  }
}
