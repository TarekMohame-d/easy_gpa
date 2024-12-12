import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:
            Text('GPA Scale', style: Theme.of(context).textTheme.titleMedium),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Grade',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                ),
                Text(
                  'Point',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                ),
              ],
            ),
            const Divider(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generateGPAItem(true, context),
                generateGPAItem(false, context),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget generateGPAItem(bool grade, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...List.generate(
        gpaScale.length,
        (index) {
          String text = grade ? gpaScale[index].$1 : gpaScale[index].$2;
          return Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14.sp),
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
