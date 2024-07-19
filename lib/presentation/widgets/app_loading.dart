import 'package:flutter/material.dart';
import 'package:test_burning_bros/core/theme/app_color.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColor.primaryColor,
    ));
  }
}
