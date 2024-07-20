import 'package:flutter/material.dart';

extension FocusNodeExtensions on FocusNode {
  void unfocusNode() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
