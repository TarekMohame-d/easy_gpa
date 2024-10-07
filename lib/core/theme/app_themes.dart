import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static bool isDarkMode = false;

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.crimsonRed,
      unselectedItemColor: AppColors.soft,
      enableFeedback: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      backgroundColor: AppColors.bottomAndUpSystemColor,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.crimsonRed,
      indicatorSize: TabBarIndicatorSize.label,
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent,
      labelColor: AppColors.crimsonRed,
      unselectedLabelColor: AppColors.soft,
      tabAlignment: TabAlignment.start,
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) => Colors.transparent),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
  );

  static void setSystemUIColor(bool isDarkTheme) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkTheme
            ? AppColors.bottomAndUpSystemColor
            : AppColors.scaffoldLightColor,
        statusBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkTheme
            ? AppColors.bottomAndUpSystemColor
            : AppColors.scaffoldLightColor,
        systemNavigationBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: isDarkTheme
            ? AppColors.bottomAndUpSystemColor
            : AppColors.scaffoldLightColor,
      ),
    );
  }
}
