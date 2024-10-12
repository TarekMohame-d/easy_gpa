import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.0.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font20lightOrangeBold = TextStyle(
    fontSize: 20.0.sp,
    color: AppColors.lightOrange,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.grey,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14BLackRegular = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14BLackBold = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16BlackBold = TextStyle(
    fontSize: 16.0.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );
}
