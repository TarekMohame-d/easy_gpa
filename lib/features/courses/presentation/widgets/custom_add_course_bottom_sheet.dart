import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/app_text_button.dart';
import 'package:easy_gpa/core/widgets/app_text_form_field.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
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
    backgroundColor: AppColors.scaffoldLightColor,
    elevation: 5,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: screenHeight(context) * 0.5,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
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
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    AppTextFormField(
                      controller: courseNameController,
                      hintText: 'Course Name',
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please enter course name';
                        }
                      },
                      backGroundColor: Colors.white,
                      inputTextStyle: AppTextStyles.font14BLackRegular,
                    ),
                    verticalSpace(12),
                    AppTextFormField(
                      controller: courseCreditsController,
                      hintText: 'Credits',
                      validator: (input) {
                        if (input.isNullOrEmpty()) {
                          return 'Please enter course credits';
                        }
                        final parsed = int.tryParse(input!);
                        if (parsed == null) {
                          return 'Course credits must be an integer';
                        }
                        if (parsed > 5) {
                          return 'Course credits cannot be greater than 5';
                        }
                        return null;
                      },
                      backGroundColor: Colors.white,
                      keyboardType: TextInputType.number,
                      inputTextStyle: AppTextStyles.font14BLackRegular,
                    ),
                    verticalSpace(12),
                    DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 18.h,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.lightOrange,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintStyle: AppTextStyles.font14GreyRegular,
                            filled: true,
                            fillColor: Colors.white,
                          ),
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
                          hint: Text(
                            'Grade',
                            style: AppTextStyles.font14GreyRegular,
                          ),
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
                    AppTextButton(
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
                            await context.read<GpaCubit>().addCourse(course);
                          } else {
                            bool hasChanges = editCourse.name != course.name ||
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
                      textStyle: AppTextStyles.font14BLackRegular,
                      backgroundColor: AppColors.lightOrange,
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
