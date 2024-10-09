import 'package:dotted_border/dotted_border.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemestersCardTemplate extends StatelessWidget {
  const SemestersCardTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<GpaCubit>().addSemester();
      },
      child: DottedBorder(
        color: Colors.grey,
        dashPattern: const [16, 8],
        radius: const Radius.circular(12),
        borderType: BorderType.RRect,
        child: SizedBox(
          height: 80.h,
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                endIndent: 7.w,
              )),
              Row(
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                  Text(
                    'Add Semesters',
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ],
              ),
              Expanded(
                  child: Divider(
                indent: 7.w,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
