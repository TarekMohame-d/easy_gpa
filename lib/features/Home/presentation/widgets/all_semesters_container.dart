import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AllSemestersContainer extends StatelessWidget {
  const AllSemestersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.3,
      width: screenWidth(context) * 0.35,
      color: AppColors.lightOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.pushNamed(Routes.semestersScreen);
            },
            child: Row(
              children: [
                Text(
                  'All',
                  style: AppTextStyles.font16BlackBold,
                ),
                const Icon(
                  Icons.expand_more_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
