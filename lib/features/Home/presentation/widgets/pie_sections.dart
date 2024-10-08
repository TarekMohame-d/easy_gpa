import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<PieChartSectionData> creatingPieSections(int selectedIndex) {
  return List.generate(4, (i) {
    final isTouched = i == selectedIndex;
    final radius = isTouched ? 70.0 : 50.0;
    final double opacity = isTouched ? 1.0 : 0.6;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.green.withOpacity(opacity),
          value: 0.5,
          radius: radius,
          showTitle: false,
          badgeWidget: Opacity(
            opacity: opacity,
            child: Container(
              width: 70.w,
              height: 70.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '50%',
                    style: AppTextStyles.font16BlackBold,
                  ),
                  Text(
                    'A',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
            ),
          ),
          badgePositionPercentageOffset: 1,
        );
      case 1:
        return PieChartSectionData(
          color: Colors.yellow.withOpacity(opacity),
          value: 0.3,
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
                    '50%',
                    style: AppTextStyles.font16BlackBold,
                  ),
                  Text(
                    'A',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
            ),
          ),
          badgePositionPercentageOffset: 1,
        );
      case 2:
        return PieChartSectionData(
          color: Colors.purple.withOpacity(opacity),
          value: 0.1,
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
                    '50%',
                    style: AppTextStyles.font16BlackBold,
                  ),
                  Text(
                    'A',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
            ),
          ),
          badgePositionPercentageOffset: 1,
        );
      case 3:
        return PieChartSectionData(
          color: Colors.red.withOpacity(opacity),
          value: 0.1,
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
                    '50%',
                    style: AppTextStyles.font16BlackBold,
                  ),
                  Text(
                    'A',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
            ),
          ),
          badgePositionPercentageOffset: 1,
        );
      default:
        throw Error();
    }
  });
}
