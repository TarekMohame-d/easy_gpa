import 'package:flutter/material.dart';

class KSnackBarTheme {
  KSnackBarTheme._();

  static final snackBarTheme = SnackBarThemeData(
    backgroundColor: const Color(0xff323232),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    
    elevation: 5,
    behavior: SnackBarBehavior.floating,
  );
}
