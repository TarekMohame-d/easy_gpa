import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/features/Home/presentation/widgets/pie_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeStatisticsPieChart extends StatefulWidget {
  const GradeStatisticsPieChart({super.key, required this.gradesStatistics});

  final Map<String, int> gradesStatistics;

  @override
  State<GradeStatisticsPieChart> createState() =>
      _GradeStatisticsPieChartState();
}

class _GradeStatisticsPieChartState extends State<GradeStatisticsPieChart> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    int numOfGrades =
        widget.gradesStatistics.values.reduce((sum, value) => sum + value);
    return numOfGrades > 0
        ? PieChart(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            PieChartData(
              centerSpaceRadius: KHelperFunctions.getScreenWidth(context) * 0.2,
              sectionsSpace: 5.r,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (event is FlTapUpEvent &&
                      pieTouchResponse != null &&
                      pieTouchResponse.touchedSection != null) {
                    setState(() {
                      selectedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  }
                },
              ),
              sections: creatingPieSections(
                selectedIndex,
                widget.gradesStatistics,
                context,
              ),
            ),
          )
        : Center(
            child: Text(
              'No Grades Available Yet',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: KFontWeightHelper.semiBold,
                  ),
            ),
          );
  }
}
