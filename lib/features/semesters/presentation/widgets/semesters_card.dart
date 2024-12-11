import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/theme/colors.dart';
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
                    style: KTextStyles.font16BlackRegular,
                  ),
                  Text(
                    'Credits: ${creditHours ?? 'N/A'}',
                    style: KTextStyles.font12GreyRegular,
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
                center: gpa != null
                    ? TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: gpa),
                        duration: Duration(seconds: 1, milliseconds: 500),
                        builder: (context, value, child) => Text(
                          value.toStringAsFixed(2),
                          style: KTextStyles.font14BlackRegular,
                        ),
                      )
                    : Text(
                        'N/A',
                        style: KTextStyles.font14BlackRegular,
                      ),
                progressColor: KColors.lightOrange,
                backgroundColor: KColors.grey,
                arcBackgroundColor: KColors.grey,
                arcType: ArcType.FULL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
