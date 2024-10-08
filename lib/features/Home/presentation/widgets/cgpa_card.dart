import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CGPACard extends StatelessWidget {
  const CGPACard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        color: Colors.white,
        shadowColor: Colors.grey,
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 70.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'ALL SEMESTER',
                          style: AppTextStyles.font14GreyRegular,
                        ),
                        Text(
                          '3.75 CGPA',
                          style: AppTextStyles.font16BlackBold,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightOrange,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              height: 0.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.assignment_turned_in,
                  ),
                  horizontalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Hours',
                        style: AppTextStyles.font14GreyRegular,
                      ),
                      Text(
                        '114',
                        style: AppTextStyles.font16BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
