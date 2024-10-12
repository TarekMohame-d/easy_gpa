import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemestersCard extends StatelessWidget {
  const SemestersCard({
    super.key,
    required this.index,
    this.gpa,
  });

  final int index;
  final double? gpa;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.coursesScreen, arguments: index);
      },
      child: SizedBox(
        height: 100.h,
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  'Semester $index',
                  style: AppTextStyles.font16BlackBold,
                ),
                const Spacer(),
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amberAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GPA',
                        style: AppTextStyles.font14BLackRegular,
                      ),
                      Text(
                        gpa?.toStringAsFixed(2) ?? 'N/A',
                        style: AppTextStyles.font14BLackRegular,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
