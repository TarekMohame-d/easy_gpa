import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:easy_gpa/core/widgets/text_button.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDeleteDialog(BuildContext context, CourseModel courseModel) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Are you sure you want to delete',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      content: Text(
        '${courseModel.name} course?',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: KFontWeightHelper.regular,
              color: KColors.grey,
            ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actions: [
        KTextButton(
          onPressed: () {
            context.pop();
          },
          padding: EdgeInsets.zero,
          overlayColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          buttonText: 'Cancel',
          textStyle: Theme.of(context).textTheme.labelMedium,
          fixedSize: Size(50.w, 50.h),
        ),
        KTextButton(
          onPressed: () async {
            await context
                .read<GpaCubit>()
                .deleteCourse(courseModel.id!)
                .then((_) => context.pop());
          },
          padding: EdgeInsets.zero,
          overlayColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          buttonText: 'Delete',
          textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.red,
              ),
          fixedSize: Size(50.w, 50.h),
        ),
      ],
    ),
  );
}
