import 'package:easy_gpa/core/functions/grade_to_number.dart';
import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/shared_pref_helper.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/usecases/filter_semester_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/insert_course_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit(
    this._addCourseUseCase,
    this._getAllCoursesUseCase,
    this._filterSemesterCoursesUseCase,
  ) : super(GpaInitial());

  final InsertCourseUseCase _addCourseUseCase;
  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final FilterSemesterCoursesUseCase _filterSemesterCoursesUseCase;

  List<CourseModel> allCourses = [];

  Map<String, int> gradesStatistics = {
    'A': 0,
    'A-': 0,
    'B+': 0,
    'B': 0,
    'B-': 0,
    'C+': 0,
    'C': 0,
    'C-': 0,
    'D+': 0,
    'D': 0,
    'D-': 0,
    'F': 0,
  };

  void calculateGradeStatistics() {
    gradesStatistics.updateAll((key, value) => 0);
    for (var course in allCourses) {
      if (gradesStatistics.containsKey(course.grade)) {
        gradesStatistics[course.grade] = gradesStatistics[course.grade]! + 1;
      }
    }
  }

  double? calculateSemesterGPA(int semesterId) {
    List<CourseModel> semesterCourses = filterSemesterCourses(semesterId);
    if (semesterCourses.isNullOrEmpty()) return null;
    double qualityPoints = 0;
    for (var course in semesterCourses) {
      qualityPoints += course.credits * convertGradeToNumber(course.grade);
    }
    emit(UpdateSemestersCardData());
    return qualityPoints /
        semesterCourses.fold(0, (sum, course) => sum + course.credits);
  }

  void calculateAllCreditHours() {
    allCreditHours = allCourses.fold(0, (sum, course) => sum + course.credits);
  }

  Future<void> calculateCGPA() async {
    if (allCourses.isEmpty) {
      cGPA = 0.0;
      return;
    }

    double qualityPoints = 0;
    calculateAllCreditHours();

    for (var course in allCourses) {
      qualityPoints += course.credits * convertGradeToNumber(course.grade);
    }

    cGPA = allCreditHours > 0 ? qualityPoints / allCreditHours : 0.0;
    await SharedPrefHelper.setData(SharedPrefKeys.cGPA, cGPA);
    await SharedPrefHelper.setData(
        SharedPrefKeys.allCreditHours, allCreditHours);
    emit(UpdateHomeScreenData());
  }

  Future<void> addCourse(CourseModel course) async {
    emit(AddCourseLoading());
    final bool result = await _addCourseUseCase.call(course);
    if (result) {
      emit(AddCourseSuccess());
      await getAllCourses();
      calculateSemesterGPA(course.semester);
    } else {
      emit(AddCourseFailure());
    }
  }

  Future<List<CourseModel>> getAllCourses() async {
    emit(GetAllCoursesLoading());
    final List<CourseModel> courses = await _getAllCoursesUseCase.call();
    if (!courses.isNullOrEmpty()) {
      allCourses = courses;
      await calculateCGPA();
      calculateGradeStatistics();
      emit(GetAllCoursesSuccess());
    } else {
      emit(GetAllCoursesFailure());
    }
    return courses;
  }

  List<CourseModel> filterSemesterCourses(int semesterId) {
    return _filterSemesterCoursesUseCase.call(allCourses, semesterId);
  }
}
