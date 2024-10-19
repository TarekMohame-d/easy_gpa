import 'package:easy_gpa/core/constants/colors.dart';
import 'package:flutter/material.dart';

class KBottomSheetTheme {
  KBottomSheetTheme._();

  static const bottomSheetTheme = BottomSheetThemeData(
    backgroundColor: KColors.scaffoldLightColor,
    elevation: 5,
    shadowColor: Colors.black,
    modalBackgroundColor: KColors.scaffoldLightColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  );
}
