import 'package:easy_gpa/core/theme/custom_themes/app_bar_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/button_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/dialog_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/elevated_button_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/floating_action_button_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/input_decoration_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/snack_bar_theme.dart';
import 'package:easy_gpa/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class KAppTheme {
  KAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: KColors.lightOrange,
    scaffoldBackgroundColor: KColors.scaffoldLightColor,
    floatingActionButtonTheme:
        KFloatingActionButtonTheme.floatingActionButtonTheme,
    elevatedButtonTheme: KElevatedButtonTheme.elevatedButtonTheme,
    appBarTheme: KAppBarTheme.appBarTheme,
    buttonTheme: KButtonTheme.buttonTheme,
    dialogTheme: KDialogTheme.dialogTheme,
    bottomSheetTheme: KBottomSheetTheme.bottomSheetTheme,
    inputDecorationTheme: KInputDecorationTheme.inputDecorationTheme,
    snackBarTheme: KSnackBarTheme.snackBarTheme,
    textTheme: KTextTheme.textTheme,
  );

  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: KColors.scaffoldLightColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: KColors.scaffoldLightColor,
      ),
    );
  }
}
