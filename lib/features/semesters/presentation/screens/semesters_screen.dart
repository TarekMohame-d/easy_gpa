import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/core/theme/app_text_styles.dart';
import 'package:easy_gpa/core/widgets/spacing.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/semesters/presentation/widgets/generate_semester.dart';
import 'package:easy_gpa/features/semesters/presentation/widgets/semesters_card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemestersScreen extends StatelessWidget {
  const SemestersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.scaffoldLightColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocConsumer<GpaCubit, GpaState>(
            listenWhen: (previous, current) => current is AddSemesterFailure,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Maximum of 12 semesters can be added',
                    style: AppTextStyles.font14WhiteRegular,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.grey,
                  duration: const Duration(seconds: 1, milliseconds: 500),
                  padding: const EdgeInsets.all(12),
                  elevation: 5,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              );
            },
            buildWhen: (previous, current) => current is AddSemesterSuccess,
            builder: (context, state) {
              return ListView(
                children: [
                  ...generateSemester(),
                  verticalSpace(12),
                  const SemestersCardTemplate(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
