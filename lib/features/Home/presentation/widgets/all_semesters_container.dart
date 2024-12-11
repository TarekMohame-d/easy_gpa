import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/font_weight_helper.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSemestersContainer extends StatelessWidget {
  const AllSemestersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KHelperFunctions.getScreenHeight(context) * 0.3,
      width: KHelperFunctions.getScreenWidth(context) * 0.35,
      color: KColors.lightOrange,
      child: Center(
        child: InkWell(
          onTap: () {
            context.pushNamed(KRoutes.semestersScreen);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'All',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: KFontWeightHelper.bold,
                      fontSize: 18.sp,
                    ),
              ),
              horizontalSpace(5),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
