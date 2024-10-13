import 'dart:developer';

import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/course_card.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/course_card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key, required this.semesterNumber});

  final int semesterNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Semester $semesterNumber',
          style: AppTextStyles.font20BlackMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<GpaCubit, GpaState>(
            buildWhen: (previous, current) =>
                current is AddCourseSuccess ||
                current is UpdateCourseSuccess ||
                current is DeleteCourseSuccess,
            builder: (context, state) {
              log('build courses screen');
              return FutureBuilder<List<CourseModel>>(
                future:
                    context.read<GpaCubit>().getSemesterCourses(semesterNumber),
                builder: (context, snapshot) {
                  final courses = snapshot.data ?? [];
                  return ListView(
                    children: [
                      ...List.generate(
                        courses.length,
                        (index) => CourseCard(
                          courseModel: courses[index],
                        ),
                      ),
                      verticalSpace(12),
                      CourseCardTemplate(
                        numberOfCourses: courses.length,
                        semesterNumber: semesterNumber,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
