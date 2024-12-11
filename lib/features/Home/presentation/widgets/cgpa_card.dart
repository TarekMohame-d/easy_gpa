import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/core/theme/colors.dart';
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
      width: KHelperFunctions.getScreenWidth(context),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        color: KColors.white,
        shadowColor: KColors.grey,
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
                          'ALL SEMESTERS',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: KColors.grey,
                                  ),
                        ),
                        Text(
                          '${cGPA.toStringAsFixed(2)} CGPA',
                          style: Theme.of(context).textTheme.bodyLarge,
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
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14.sp,
                              color: KColors.grey,
                            ),
                      ),
                      Text(
                        allCreditHours.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
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
