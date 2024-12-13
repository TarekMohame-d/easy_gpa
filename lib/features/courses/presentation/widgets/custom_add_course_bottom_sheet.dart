import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/core/widgets/text_button.dart';
import 'package:easy_gpa/core/widgets/text_form_field.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customAddCourseBottomSheet(BuildContext context,
    [int? semester, CourseModel? editCourse]) {
  String? selectedGrade;
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseCreditsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  if (editCourse != null) {
    courseNameController.text = editCourse.name;
    courseCreditsController.text = editCourse.credits.toString();
    selectedGrade = editCourse.grade;
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: KHelperFunctions.getScreenHeight(context) * 0.5,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: KColors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    KTextFormField(
                      controller: courseNameController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please enter course name';
                        }
                        return null;
                      },
                      labelText: 'Course Name',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14.sp),
                      inputTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14.sp),
                    ),
                    verticalSpace(16),
                    KTextFormField(
                      controller: courseCreditsController,
                      validator: (input) {
                        if (input.isNullOrEmpty()) {
                          return 'Please enter course credits';
                        }
                        final parsed = int.tryParse(input!);
                        if (parsed == null) {
                          return 'Course credits must be an integer';
                        }
                        if (parsed > 8) {
                          return 'Course credits cannot be greater than 8';
                        }
                        if (parsed == 0) {
                          return 'Course credits cannot be 0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      labelText: 'Credits',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14.sp),
                      inputTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14.sp),
                    ),
                    verticalSpace(16),
                    DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                            labelText: 'Grade',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14.sp),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.sp),
                          value: selectedGrade,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select grade';
                            }
                            return null;
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGrade = newValue;
                            });
                          },
                          items: grades.map((String grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(grade),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    Align(
                      alignment: Alignment.center,
                      child: KTextButton(
                        fixedSize: Size(
                            KHelperFunctions.getScreenWidth(context) * 0.5,
                            50.h),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            CourseModel course = CourseModel(
                              name: courseNameController.text,
                              credits: int.parse(courseCreditsController.text),
                              semester: editCourse?.semester ?? semester!,
                              grade: selectedGrade!,
                              id: editCourse?.id,
                            );
                            if (editCourse == null) {
                              await context
                                  .read<GpaCubit>()
                                  .insertCourse(course);
                            } else {
                              bool hasChanges =
                                  editCourse.name != course.name ||
                                      editCourse.credits != course.credits ||
                                      editCourse.grade != course.grade;
                              if (hasChanges) {
                                await context
                                    .read<GpaCubit>()
                                    .updateCourse(course);
                              }
                            }
                            context.pop();
                          }
                        },
                        buttonText:
                            editCourse == null ? 'Add Course' : 'Update Course',
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: KColors.white, fontSize: 14.sp),
                        backgroundColor: KColors.lightOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

List<String> grades = [
  'A+',
  'A',
  'A-',
  'B+',
  'B',
  'B-',
  'C+',
  'C',
  'C-',
  'D+',
  'D',
  'D-',
  'F',
];
