import 'package:flutter/material.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/theming/colors.dart';
import 'package:secret_vault/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24mainBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: mainColor,
    fontFamily: 'exo2',
  );

  static TextStyle font24Regular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'exo2',
  );

  static TextStyle font12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'exo2',
  );

  static TextStyle font12GreySemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'exo2',
    color: grey,
  );

  static TextStyle font13LightGreyRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'exo2',
    color: lightGray,
  );

  static TextStyle font14LightGreyRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'exo2',
    color: lightGray,
  );

  static TextStyle font22Regular = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'exo2',
  );
}
