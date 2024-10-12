import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/custom_add_course_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseModel.name,
                    style: AppTextStyles.font14BLackBold,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Text(
                        courseModel.grade,
                        style: AppTextStyles.font14BLackRegular,
                      ),
                      horizontalSpace(20),
                      Text(
                        courseModel.credits.toString(),
                        style: AppTextStyles.font14BLackRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75.h,
              child: const VerticalDivider(
                color: Colors.grey,
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        content: Text(
                          'Are you sure you want to delete ${courseModel.name} course?',
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<GpaCubit>()
                                  .deleteCourse(courseModel.id!);
                              Navigator.pop(context);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
