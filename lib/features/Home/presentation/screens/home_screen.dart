import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:easy_gpa/core/widgets/custom_snack_bar.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/all_semesters_container.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/cgpa_card.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/grade_statistics_pie_chart.dart';
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
            current is SavePdfSuccess ||
            current is SavePdfFailure ||
            current is GetAllCoursesFailure,
        listener: (context, state) {
          if (state is SavePdfSuccess) {
            customSnackBar(
                context, 'PDF saved successfully:\n${state.directoryPath}');
          } else if (state is SavePdfFailure) {
            customSnackBar(context, state.errorMessage);
          } else if (state is GetAllCoursesFailure) {
            customSnackBar(context, state.errorMessage);
          }
        },
        buildWhen: (previous, current) =>
            current is InsertCourseSuccess ||
            current is UpdateCourseSuccess ||
            current is DeleteCourseSuccess,
        builder: (context, state) {
          return FutureBuilder(
            future: context.read<GpaCubit>().allCourses.isEmpty
                ? context.read<GpaCubit>().getAllCourses()
                : null,
            builder: (context, snapshot) => Column(
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
                          'Grade Point\nAverage',
                          style: Theme.of(context).textTheme.headlineLarge,
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
                    child: Stack(
                      children: [
                        Text(
                          'Grade Statistics',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: KFontWeightHelper.semiBold,
                                  ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: KColors.grey.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width:
                                KHelperFunctions.getScreenWidth(context) * 0.8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: KColors.grey.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GradeStatisticsPieChart(
                            gradesStatistics:
                                context.read<GpaCubit>().gradesStatistics,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 8.h,
                          child: FloatingActionButton(
                            onPressed: () {
                              customDialog(context);
                            },
                            heroTag: 'unique_tag_2',
                            child: const Icon(
                              Icons.info_outline_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
