import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

void customDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('GPA Scale'),
        backgroundColor: AppColors.scaffoldLightColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Grade',
                  style: AppTextStyles.font16BlackBold,
                ),
                Text(
                  'GPA',
                  style: AppTextStyles.font16BlackBold,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generateGPAItem(true),
                generateGPAItem(false),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget generateGPAItem(bool grade) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...List.generate(
        gpaScale.length,
        (index) {
          String text = grade ? gpaScale[index].$1 : gpaScale[index].$2;
          return Text(
            text,
            style: AppTextStyles.font14BLackRegular,
          );
        },
      ),
    ],
  );
}

List<(String, String)> gpaScale = [
  ('A+', '4.0'),
  ('A', '4.0'),
  ('A-', '3.7'),
  ('B+', '3.3'),
  ('B', '3.0'),
  ('B-', '2.7'),
  ('C+', '2.3'),
  ('C', '2.0'),
  ('C-', '1.7'),
  ('D+', '1.3'),
  ('D', '1.0'),
  ('D-', '0.7'),
  ('F', '0.0'),
];
