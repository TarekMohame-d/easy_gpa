import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
  );

  static void setSystemUIColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkMode
            ? AppColors.scaffoldDarkColor
            : AppColors.scaffoldLightColor,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkMode
            ? AppColors.scaffoldDarkColor
            : AppColors.scaffoldLightColor,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: isDarkMode
            ? AppColors.scaffoldDarkColor
            : AppColors.scaffoldLightColor,
      ),
    );
  }
}
