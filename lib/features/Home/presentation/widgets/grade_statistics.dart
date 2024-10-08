import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/pie_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GradeStatistics extends StatefulWidget {
  const GradeStatistics({super.key});

  @override
  State<GradeStatistics> createState() => _GradeStatisticsState();
}

class _GradeStatisticsState extends State<GradeStatistics> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationCurve: Curves.easeInOut,
      swapAnimationDuration: const Duration(milliseconds: 300),
      PieChartData(
        centerSpaceRadius: screenWidth(context) * 0.2,
        sectionsSpace: 3,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              selectedIndex =
                  pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
            });
          },
        ),
        sections: creatingPieSections(selectedIndex),
      ),
    );
  }
}
