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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        courseModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: KTextStyles.font16BlackRegular,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 0,
                    ),
                    Row(
                      children: [
                        horizontalSpace(25),
                        Text(
                          courseModel.grade,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: KTextStyles.font14BlackRegular,
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
                          style: KTextStyles.font14BlackRegular,
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

showDeleteDialog(BuildContext context, CourseModel courseModel) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Are you sure you want to delete',
        style: KTextStyles.font16BlackMedium,
      ),
      content: Text(
        '${courseModel.name} course?',
        style: KTextStyles.font14GreyRegular,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.zero,
            ),
          ),
          child: Text(
            'Cancel',
            style: KTextStyles.font14BlackMedium,
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.read<GpaCubit>().deleteCourse(courseModel.id!);
            Navigator.pop(context);
          },
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.zero,
            ),
          ),
          child: Text(
            'Delete',
            style: KTextStyles.font14BlackMedium.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    ),
  );
}
