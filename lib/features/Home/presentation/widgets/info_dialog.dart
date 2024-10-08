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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: const EdgeInsets.all(10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
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
            ...generateGPAItem(),
          ],
        ),
      );
    },
  );
}

List<Widget> generateGPAItem() {
  return List.generate(
    gpaScale.length,
    (index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            gpaScale[index].$1,
            style: AppTextStyles.font14BLackRegular,
          ),
          Text(
            gpaScale[index].$2,
            style: AppTextStyles.font14BLackRegular,
          ),
        ],
      );
    },
  );
}

List<(String, String)> gpaScale = [
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
