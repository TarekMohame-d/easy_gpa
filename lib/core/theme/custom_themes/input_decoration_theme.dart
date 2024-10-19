import 'package:easy_gpa/core/constants/colors.dart';
import 'package:flutter/material.dart';

class KInputDecorationTheme {
  KInputDecorationTheme._();

  static final inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: KColors.lightOrange,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: KColors.white,
  );
}
