import 'package:flutter/material.dart';

class AppTextStyles {
  static String fontRegular = 'Josefin';
  static String fontBold = 'Josefin-Bold';
  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        height: height,
        fontSize: fontSize ?? 14,
        decoration: decoration,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? fontRegular);
  }

  static TextStyle textStyleBold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        height: height,
        fontSize: fontSize ?? 14,
        decoration: decoration,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontBold);
  }
}
