import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        context.pushNamed(KRoutes.coursesScreen, arguments: index);
      },
      child: Card(
        elevation: 5,
        shadowColor: KColors.black,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semester $index',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: KFontWeightHelper.regular),
                  ),
                  Text(
                    'Credits: ${creditHours ?? 'N/A'}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: KColors.grey),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                      )
                    : Text(
                        'N/A',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14.sp),
                      ),
                progressColor: KColors.lightOrange,
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
