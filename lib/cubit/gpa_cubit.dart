import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit() : super(GpaInitial());

  int cGPA = 0;
  int creditHours = 0;

  Future<void> addSemester() async {
    if (numOfSemesters < 12) {
      numOfSemesters++;
      await SharedPrefHelper.setData(
          SharedPrefKeys.numberOfSemesters, numOfSemesters);
      emit(AddSemesterSuccess());
    }else{
      emit(AddSemesterFailure());
    }
  }
}
