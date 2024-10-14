import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CGPACard extends StatelessWidget {
  const CGPACard({super.key, required this.cGPA, required this.allCreditHours});

  final double cGPA;
  final int allCreditHours;

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
                          '${cGPA.toStringAsFixed(2)} CGPA',
                          style: AppTextStyles.font16BlackBold,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    heroTag: 'unique_tag_1',
                    onPressed: () {
                      context.read<GpaCubit>().generateAndSavePdf();
                    },
                    child: const Icon(
                      Icons.download,
                    ),
                  )
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
                        'Total Credit Hours',
                        style: AppTextStyles.font14GreyRegular,
                      ),
                      Text(
                        allCreditHours.toString(),
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
