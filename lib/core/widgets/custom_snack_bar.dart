import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar(BuildContext context, String message,
    [Duration duration = const Duration(seconds: 1, milliseconds: 500)]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: KColors.white),
      ),
      duration: duration,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    ),
  );
}
