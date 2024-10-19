import 'package:easy_gpa/core/constants/colors.dart';
import 'package:flutter/material.dart';

class KFloatingActionButtonTheme {
  KFloatingActionButtonTheme._();

  static final floatingActionButtonTheme = FloatingActionButtonThemeData(
    shape: const CircleBorder(),
    backgroundColor: KColors.lightOrange,
    elevation: 5,
    enableFeedback: true,
    splashColor: Colors.grey.withOpacity(0.3),
  );
}
