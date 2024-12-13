import 'package:easy_gpa/core/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<PieChartSectionData> creatingPieSections(
  int selectedIndex,
  Map<String, int> gradesStatistics,
  BuildContext context,
) {
  Map<String, int> filteredGradesStatistics = {
    for (var entry in gradesStatistics.entries)
      if (entry.value > 0) entry.key: entry.value
  };

  int totalCourses =
      filteredGradesStatistics.values.reduce((sum, value) => sum + value);

  return List.generate(
    filteredGradesStatistics.length,
    (index) {
      final isSelected = index == selectedIndex;
      final radius = isSelected ? 70.0 : 50.0;
      final double opacity = isSelected ? 1.0 : 0.6;
      double percentage = totalCourses > 0
          ? (filteredGradesStatistics.values.elementAt(index) / totalCourses) *
              360
          : 0;

      final Color sectionColor =
          getColor(filteredGradesStatistics.keys.elementAt(index))
              .withOpacity(opacity);

      return PieChartSectionData(
        color: sectionColor,
        value: percentage + 20,
        radius: radius,
        showTitle: false,
        badgeWidget: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(opacity),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${(percentage / 360 * 100).toStringAsFixed(1)}%',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: KColors.black.withOpacity(opacity),
                    ),
              ),
              Text(
                filteredGradesStatistics.keys.elementAt(index),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: KColors.grey.withOpacity(opacity),
                    ),
              ),
            ],
          ),
        ),
        badgePositionPercentageOffset: 1,
      );
    },
  );
}

Color getColor(String grade) {
  switch (grade) {
    case 'A+':
      return const Color(0xff1a7431);
    case 'A':
      return const Color(0xff208b3a);
    case 'A-':
      return const Color(0xff2dc653);
    case 'B+':
      return const Color(0xfffff200);
    case 'B':
      return const Color(0xffffe600);
    case 'B-':
      return const Color(0xffffd900);
    case 'C+':
      return const Color(0xffff8000);
    case 'C':
      return const Color(0xffff8c00);
    case 'C-':
      return const Color(0xffff9900);
    case 'D+':
      return const Color(0xffbd1f36);
    case 'D':
      return const Color(0xffef233c);
    case 'D-':
      return const Color(0xffef233c);
    case 'F':
      return const Color(0xffef233c);
    default:
      return Colors.grey;
  }
}
