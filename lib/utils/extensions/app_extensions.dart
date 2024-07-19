import 'package:flutter/material.dart';

extension FocusNodeExtensions on FocusNode {
  void unfocusNode() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension IntExtensions on int {
  String formatTime() {
    int hours = this ~/ 60;
    int remainingMinutes = this % 60;

    String hourString = hours > 0 ? '${hours}hr ' : '';
    String minuteString = '${remainingMinutes}m';

    return hourString + minuteString;
  }
}
