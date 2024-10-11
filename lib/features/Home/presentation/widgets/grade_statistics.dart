import 'dart:developer';

import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/pie_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GradeStatistics extends StatefulWidget {
  const GradeStatistics({super.key, required this.gradesStatistics});

  final Map<String, int> gradesStatistics;

  @override
  State<GradeStatistics> createState() => _GradeStatisticsState();
}

class _GradeStatisticsState extends State<GradeStatistics> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    int numOfGrades = widget.gradesStatistics.values.reduce((a, b) => a + b);
    return numOfGrades > 0
        ? PieChart(
            swapAnimationCurve: Curves.easeInOut,
            swapAnimationDuration: const Duration(milliseconds: 300),
            PieChartData(
              centerSpaceRadius: screenWidth(context) * 0.2,
              sectionsSpace: 3,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (event is FlTapUpEvent &&
                      pieTouchResponse != null &&
                      pieTouchResponse.touchedSection != null) {
                    setState(() {
                      selectedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                    log(selectedIndex.toString());
                  }
                },
              ),
              sections: creatingPieSections(
                selectedIndex + 1,
                widget.gradesStatistics,
              ),
            ),
          )
        : Center(
            child: Text(
              'No Grades',
              style: AppTextStyles.font16BlackBold,
            ),
          );
  }
}
