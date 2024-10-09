import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemestersCard extends StatefulWidget {
  const SemestersCard({super.key, required this.index});

  final int index;

  @override
  State<SemestersCard> createState() => _SemestersCardState();
}

class _SemestersCardState extends State<SemestersCard> {
  double? gpa;

  @override
  void initState() {
    gpa = context.read<GpaCubit>().calculateSemesterGPA(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.coursesScreen, arguments: widget.index);
      },
      child: BlocBuilder<GpaCubit, GpaState>(
        buildWhen: (previous, current) => current is UpdateSemestersCardData,
        builder: (context, state) {
          return SizedBox(
            height: 100.h,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      'Semester ${widget.index}',
                      style: AppTextStyles.font16BlackBold,
                    ),
                    const Spacer(),
                    Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amberAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GPA',
                            style: AppTextStyles.font14BLackRegular,
                          ),
                          Text(
                            gpa?.toStringAsFixed(3) ?? 'N/A',
                            style: AppTextStyles.font14BLackRegular,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
