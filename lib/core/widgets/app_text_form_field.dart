// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../themes/app_colors.dart';
// import '../themes/styles.dart';

// class AppTextFormField extends StatelessWidget {
//   final EdgeInsetsGeometry? contentPadding;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final TextStyle? inputTextStyle;
//   final TextStyle? hintStyle;
//   final String hintText;
//   final bool? isObscureText;
//   final Widget? suffixIcon;
//   final Color? backGroundColor;
//   final TextEditingController? controller;
//   final Function(String?) validator;
//   const AppTextFormField({
//     super.key,
//     this.contentPadding,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.inputTextStyle,
//     this.hintStyle,
//     this.isObscureText,
//     this.suffixIcon,
//     required this.hintText,
//     this.backGroundColor,
//     this.controller,
//     required this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding: contentPadding ??
//             EdgeInsets.symmetric(
//               horizontal: 20.w,
//               vertical: 18.h,
//             ),
//         focusedBorder: focusedBorder ??
//             OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: AppColors.mainBlue,
//                 width: 1.3,
//               ),
//               borderRadius: BorderRadius.circular(16),
//             ),
//         enabledBorder: enabledBorder ??
//             OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: AppColors.lighterGray,
//                 width: 1.3,
//               ),
//               borderRadius: BorderRadius.circular(16),
//             ),
//         errorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 1.3,
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 1.3,
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
//         hintText: hintText,
//         suffixIcon: suffixIcon,
//         filled: true,
//         fillColor: backGroundColor ?? AppColors.moreLightGray,
//       ),
//       obscureText: isObscureText ?? false,
//       style: TextStyles.font14DarkBlueMedium,
//       validator: (value) {
//         return validator(value);
//       },
//     );
//   }
// }
