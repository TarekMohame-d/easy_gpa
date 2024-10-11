import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<PieChartSectionData> creatingPieSections(
  int selectedIndex,
  Map<String, int> gradesStatistics,
) {
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
      final double opacity = isTouched ? 1.0 : 0.0;
      final double colorOpacity = isTouched ? 1.0 : 0.5;

      // Calculate the percentage for each grade
      double percentage = totalCourses > 0
          ? (gradesStatistics.values.elementAt(index) / totalCourses) * 100
          : 0;
      return PieChartSectionData(
        color: colors[index % colors.length].withOpacity(colorOpacity),
        value: percentage,
        radius: radius,
        title: gradesStatistics.keys.elementAt(index),
        showTitle: true,
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
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: Colors.black.withOpacity(opacity),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                gradesStatistics.keys.elementAt(index),
                style: TextStyle(
                  color: Colors.grey.withOpacity(opacity),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
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
