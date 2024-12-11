import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? isDense;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  const KTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.hintText,
    this.backGroundColor,
    this.controller,
    required this.validator,
    this.errorBorder,
    this.focusedErrorBorder,
    this.labelText,
    this.cursorColor,
    this.prefixIcon,
    this.disabledBorder,
    this.enabled,
    this.isDense,
    this.keyboardType,
    this.textInputAction,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor ?? KColors.black,
      controller: controller,
      // onTapOutside: (_) {
      //   FocusManager.instance.primaryFocus?.unfocus();
      // },
      onTap: () {
        if (controller != null) {
          controller!.selection = TextSelection.fromPosition(
            TextPosition(offset: controller!.text.length),
          );
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: KFontWeightHelper.medium),
        isDense: isDense,
        contentPadding: contentPadding,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        disabledBorder: disabledBorder,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backGroundColor,
      ),
      enabled: enabled,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
    );
  }
}
