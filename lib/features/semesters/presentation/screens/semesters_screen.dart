import 'dart:developer';

import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:easy_gpa/features/semesters/presentation/widgets/semesters_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemestersScreen extends StatelessWidget {
  const SemestersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: BlocBuilder<GpaCubit, GpaState>(
            buildWhen: (previous, current) =>
                current is AddCourseSuccess ||
                current is UpdateCourseSuccess ||
                current is DeleteCourseSuccess,
            builder: (context, state) {
              log('build semesters screen');
              return ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  final result =
                      context.read<GpaCubit>().calculateSemesterData(index + 1);
                  return SemestersCard(
                    index: index + 1,
                    gpa: result.$1,
                    creditHours: result.$2,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
