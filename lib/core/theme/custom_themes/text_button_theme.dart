import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KTextButtonTheme {
  KTextButtonTheme._();

  static final textButtonLightTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: KColors.lightOrange,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      fixedSize: Size(double.maxFinite, 50),
    ),
  );
}
