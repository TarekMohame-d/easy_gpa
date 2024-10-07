import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final void Function(String)? onChanged;
  final TextStyle? style;
  const AppTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.suffixIcon,
    required this.hintText,
    this.backGroundColor,
    this.controller,
    this.prefixIcon,
    this.onChanged,
    this.borderRadius,
    this.style,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 16.h,
            ),
        border: border,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.scaffoldLightColor,
                width: 1.3,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(24),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.3,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(24),
            ),
        hintStyle: hintStyle ?? AppTextStyles.font14GreyRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backGroundColor ?? AppColors.scaffoldLightColor,
      ),
      style: style ?? AppTextStyles.font14WhiteMedium,
      cursorColor: Colors.black,
      onChanged: onChanged,
    );
  }
}
