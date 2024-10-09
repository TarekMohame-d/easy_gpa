import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<PieChartSectionData> creatingPieSections(
    int selectedIndex, Map<String, int> gradesStatistics) {
  // Predefined colors for different grades
  List<Color> colors = [
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.teal,
    Colors.brown,
  ];

  // Calculate the total number of courses for percentage calculation
  int totalCourses = gradesStatistics.values.reduce((a, b) => a + b);

  return List.generate(
    gradesStatistics.length,
    (index) {
      final isTouched = index == selectedIndex;
      final radius = isTouched ? 70.0 : 50.0;
      final double opacity = isTouched ? 1.0 : 0.6;

      // Calculate the percentage for each grade
      double percentage = totalCourses > 0
          ? (gradesStatistics.values.elementAt(index) / totalCourses) * 100
          : 0;
      return PieChartSectionData(
        color: colors[index % colors.length].withOpacity(opacity),
        value: percentage,
        radius: radius,
        showTitle: false,
        badgeWidget: Opacity(
          opacity: opacity,
          child: Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(opacity),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${percentage.toStringAsFixed(1)}%',
                  style: AppTextStyles.font16BlackBold,
                ),
                Text(
                  gradesStatistics.keys.elementAt(index),
                  style: AppTextStyles.font14GreyRegular,
                ),
              ],
            ),
          ),
        ),
        badgePositionPercentageOffset: 1,
      );
    },
  );
}
