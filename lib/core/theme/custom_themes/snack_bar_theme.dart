import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KSnackBarTheme {
  KSnackBarTheme._();

  static final snackBarTheme = SnackBarThemeData(
    backgroundColor: KColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    elevation: 5,
    dismissDirection: DismissDirection.down,
    
    behavior: SnackBarBehavior.floating,
  );
}
