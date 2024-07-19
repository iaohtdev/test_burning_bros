import 'package:test_burning_bros/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static void showAppDialog(BuildContext context,
      {Color? backgroundColor, Widget? content}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        backgroundColor: backgroundColor ?? AppColor.primaryColor,
        child: Wrap(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: content ?? Container()),
          ],
        ),
      ),
    );
  }
}
