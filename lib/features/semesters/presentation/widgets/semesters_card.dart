import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SemestersCard extends StatelessWidget {
  const SemestersCard({
    super.key,
    required this.index,
    this.gpa,
    this.creditHours,
  });

  final int index;
  final double? gpa;
  final int? creditHours;

  Color getColor(double gpa) {
    if (gpa >= 3.0) {
      return Colors.green;
    } else if (gpa >= 2.0) {
      return Colors.orange;
    } else if (gpa >= 0) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.coursesScreen, arguments: index);
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semester $index',
                    style: AppTextStyles.font16BlackRegular,
                  ),
                  Text(
                    'Credits: ${creditHours ?? 'N/A'}',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              CircularPercentIndicator(
                radius: 30.0,
                animation: true,
                curve: Curves.easeInOut,
                animationDuration: 1500,
                lineWidth: 5.0,
                percent: gpa != null ? gpa! / 4 : 0,
                center: Text(
                  gpa != null ? gpa!.toStringAsFixed(2) : 'N/A',
                  style: AppTextStyles.font14BlackRegular,
                ),
                progressColor: AppColors.lightOrange,
                arcBackgroundColor: Colors.grey,
                arcType: ArcType.FULL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
