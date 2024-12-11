import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: KTextStyles.font14GreyRegular,
      ),
      duration: const Duration(seconds: 1, milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
    ),
  );
}
