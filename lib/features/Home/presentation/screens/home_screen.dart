import 'dart:developer';

import 'package:easy_gpa/core/constants/text_strings.dart';
import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/custom_snack_bar.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/all_semesters_container.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/cgpa_card.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/grade_statistics.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GpaCubit, GpaState>(
        listenWhen: (previous, current) =>
            current is SavePdfSuccess || current is SavePdfFailure,
        listener: (context, state) {
          if (state is SavePdfSuccess) {
            customSnackBar(context, 'PDF saved successfully');
          } else if (state is SavePdfFailure) {
            customSnackBar(context, 'Failed to save PDF');
          }
        },
        buildWhen: (previous, current) =>
            current is AddCourseSuccess ||
            current is UpdateCourseSuccess ||
            current is DeleteCourseSuccess,
        builder: (context, state) {
          log('build home screen');
          return FutureBuilder(
            future: context.read<GpaCubit>().allCourses.isNullOrEmpty()
                ? context.read<GpaCubit>().getAllCourses()
                : null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  SizedBox(
                    height: KHelperFunctions.getScreenHeight(context) * 0.4,
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: AllSemestersContainer(),
                        ),
                        Positioned(
                          top: 50.h,
                          left: 20.w,
                          child: Text(
                            KTextStrings.homeHeaderText,
                            style: AppTextStyles.font20BlackSemiBold.copyWith(
                              fontSize: 28.sp,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: CGPACard(
                            cGPA: context.read<GpaCubit>().cGPA,
                            allCreditHours:
                                context.read<GpaCubit>().allCreditHours,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(32),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            KTextStrings.gradeStatistics,
                            style: AppTextStyles.font20BlackSemiBold,
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.3,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: KHelperFunctions.getScreenWidth(
                                            context) *
                                        0.8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                                GradeStatistics(
                                  gradesStatistics:
                                      context.read<GpaCubit>().gradesStatistics,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customDialog(context);
        },
        heroTag: 'unique_tag_2',
        child: const Icon(
          Icons.info_outline_rounded,
        ),
      ),
    );
  }
}
