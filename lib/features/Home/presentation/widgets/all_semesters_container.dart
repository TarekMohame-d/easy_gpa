import 'package:easy_gpa/core/helpers/constants.dart';
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
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All',
              style: AppTextStyles.font16BlackBold,
            ),
            const Icon(
              Icons.expand_more_rounded,
            )
          ],
        ),
      ),
    );
  }
}
