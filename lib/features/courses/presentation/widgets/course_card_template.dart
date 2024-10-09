import 'package:dotted_border/dotted_border.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/custom_add_course_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCardTemplate extends StatelessWidget {
  const CourseCardTemplate({super.key, required this.semesterNumber});

  final int semesterNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customAddCourseBottomSheet(context, semesterNumber);
      },
      child: DottedBorder(
        color: Colors.grey,
        dashPattern: const [16, 8],
        radius: const Radius.circular(12),
        borderType: BorderType.RRect,
        child: SizedBox(
          height: 80.h,
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                endIndent: 7.w,
              )),
              Row(
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                  Text(
                    'Add Course',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
              Expanded(
                  child: Divider(
                indent: 7.w,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
