import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KDialogTheme {
  KDialogTheme._();

  static final dialogTheme = DialogTheme(
    backgroundColor: KColors.scaffoldLightColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 5,
    shadowColor: Colors.black,
  );
}
