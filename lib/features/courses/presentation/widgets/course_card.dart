import 'package:easy_gpa/core/theme/colors.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/custom_add_course_bottom_sheet.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: KColors.black,
      color: KColors.white,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: KColors.grey,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Text(
                        courseModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 16.sp),
                      ),
                    ),
                    const Divider(
                      color: KColors.grey,
                      height: 0,
                    ),
                    Row(
                      children: [
                        horizontalSpace(25),
                        Text(
                          courseModel.grade,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 40.h,
                          child: const VerticalDivider(
                            width: 50,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          courseModel.credits.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 40.h,
                          child: const VerticalDivider(
                            width: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    customAddCourseBottomSheet(context, null, courseModel);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteDialog(context, courseModel);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
