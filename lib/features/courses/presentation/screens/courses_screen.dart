import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/course_card.dart';
import 'package:easy_gpa/features/courses/presentation/widgets/course_card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key, required this.semesterNumber});

  final int semesterNumber;

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<CourseModel> courses = [];

  @override
  void initState() {
    courses =
        context.read<GpaCubit>().filterSemesterCourses(widget.semesterNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.scaffoldLightColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<GpaCubit, GpaState>(
            buildWhen: (previous, current) =>
                current is AddCourseSuccess || current is GetAllCoursesSuccess,
            builder: (context, state) {
              courses = context
                  .read<GpaCubit>()
                  .filterSemesterCourses(widget.semesterNumber);
              return ListView(
                children: [
                  ...List.generate(
                    courses.length,
                    (index) => CourseCard(
                      courseModel: CourseModel(
                        credits: courses[index].credits,
                        name: courses[index].name,
                        grade: courses[index].grade,
                        semester: widget.semesterNumber,
                      ),
                    ),
                  ),
                  verticalSpace(12),
                  CourseCardTemplate(
                    semesterNumber: widget.semesterNumber,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
