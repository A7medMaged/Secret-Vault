import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension BoolExtension on bool? {
  bool isNullOrFalse() => this == null || this == false;
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension NumExtensions on num {
  double get h => ScreenUtil().setHeight(this);
  double get w => ScreenUtil().setWidth(this);
  double get r => ScreenUtil().radius(this);
  double get sp => ScreenUtil().setSp(this);
}
