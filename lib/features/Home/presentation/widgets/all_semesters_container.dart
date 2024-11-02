import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/theme/colors.dart';
import 'package:flutter/material.dart';

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
            context.pushNamed(Routes.semestersScreen);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'All',
                style: KTextStyles.font16BlackBold,
              ),
              const Icon(
                Icons.expand_more_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
