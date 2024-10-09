import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/theme/app_colors.dart';
import 'package:easy_gpa/features/semesters/presentation/widgets/semesters_card.dart';
import 'package:flutter/material.dart';
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
          child: ListView(
            children: [
              ...List.generate(
                12,
                (index) => SemestersCard(
                  index: index + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
