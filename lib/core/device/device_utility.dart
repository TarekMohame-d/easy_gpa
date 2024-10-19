import 'package:easy_gpa/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KDeviceUtility {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void setStatusBarColor([Color? color]) {
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
