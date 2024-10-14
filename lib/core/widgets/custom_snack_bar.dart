import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.font14GreyRegular,
      ),
      backgroundColor: const Color(0xff323232),
      duration: const Duration(seconds: 1, milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
