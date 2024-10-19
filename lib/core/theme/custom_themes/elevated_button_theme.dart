import 'package:easy_gpa/core/constants/colors.dart';
import 'package:flutter/material.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: KColors.lightOrange,
      elevation: 3,
      enableFeedback: true,
    ),
  );
}
