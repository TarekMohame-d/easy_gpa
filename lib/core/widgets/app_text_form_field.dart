import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;

  const KTextFormField({
    super.key,
    this.contentPadding,
    this.inputTextStyle,
    required this.hintText,
    this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      style: inputTextStyle ?? AppTextStyles.font14BlackRegular,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
