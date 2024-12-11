import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KInputDecorationTheme {
  KInputDecorationTheme._();

  static final inputDecorationTheme = InputDecorationTheme(
    // isDense: true,
    labelStyle: const TextStyle(
      color: KColors.black,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.lightOrange.withOpacity(0.6),
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.black.withOpacity(0.6),
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.grey,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: KColors.white,
  );
}
