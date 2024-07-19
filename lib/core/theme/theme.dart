import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeApp = ThemeData(
      fontFamily: AppTextStyles.fontRegular,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.white));
}
