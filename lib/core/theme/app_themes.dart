import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: const CircleBorder(),
      backgroundColor: AppColors.lightOrange,
      elevation: 5,
      enableFeedback: true,
      splashColor: Colors.grey.withOpacity(0.3),
    ),
    splashColor: Colors.grey.withOpacity(0.3),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      color: AppColors.scaffoldLightColor,
    ),
    buttonTheme: ButtonThemeData(
      splashColor: Colors.grey.withOpacity(0.3),
      buttonColor: AppColors.lightOrange,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.scaffoldLightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      shadowColor: Colors.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.scaffoldLightColor,
      elevation: 5,
      shadowColor: Colors.black,
      modalBackgroundColor: AppColors.scaffoldLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightOrange,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );

  static void setSystemUIColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.scaffoldLightColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.scaffoldLightColor,
      ),
    );
  }
}
