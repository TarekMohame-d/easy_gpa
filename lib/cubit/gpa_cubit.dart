import 'package:easy_gpa/core/functions/grade_to_number.dart';
import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/usecases/delete_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/get_semester_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/insert_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/update_course_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit(
    this._addCourseUseCase,
    this._getAllCoursesUseCase,
    this._getSemesterCoursesUseCase,
    this._updateCourseUseCase,
    this._deleteCourseUseCase,
  ) : super(GpaInitial());

  final InsertCourseUseCase _addCourseUseCase;
  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final GetSemesterCoursesUseCase _getSemesterCoursesUseCase;
  final UpdateCourseUseCase _updateCourseUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;

  List<CourseModel> allCourses = [];

  Map<String, int> gradesStatistics = {
    'A+': 0,
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

  double cGPA = 0.0;
  int allCreditHours = 0;

  void calculateGradeStatistics() {
    gradesStatistics.updateAll((key, value) => 0);
    for (var course in allCourses) {
      if (gradesStatistics.containsKey(course.grade)) {
        gradesStatistics[course.grade] = gradesStatistics[course.grade]! + 1;
      }
    }
  }

  Future<double?> calculateSemesterGPA(int semesterId) async {
    List<CourseModel> semesterCourses = await getSemesterCourses(semesterId);

    if (semesterCourses.isNullOrEmpty()) return null;
    double qualityPoints = 0;
    for (var course in semesterCourses) {
      qualityPoints += course.credits * convertGradeToNumber(course.grade);
    }
    return qualityPoints /
        semesterCourses.fold(0, (sum, course) => sum + course.credits);
  }

  void calculateAllCreditHours() {
    allCreditHours = allCourses.fold(0, (sum, course) => sum + course.credits);
  }

  void calculateCGPA() {
    if (allCourses.isEmpty) {
      cGPA = 0.0;
      return;
    }

    double qualityPoints = 0;
    for (var course in allCourses) {
      qualityPoints += course.credits * convertGradeToNumber(course.grade);
    }
    cGPA = allCreditHours > 0 ? qualityPoints / allCreditHours : 0.0;
  }

  void calculateHomeScreenData() {
    calculateAllCreditHours();
    calculateCGPA();
    calculateGradeStatistics();
  }

  Future<void> addCourse(CourseModel course) async {
    emit(AddCourseLoading());
    final bool result = await _addCourseUseCase.call(course);
    if (result) {
      allCourses.add(course);
      calculateHomeScreenData();
      emit(AddCourseSuccess());
    } else {
      emit(AddCourseFailure());
    }
  }

  Future<void> getAllCourses() async {
    final List<CourseModel> courses = await _getAllCoursesUseCase.call();
    if (!courses.isNullOrEmpty()) {
      allCourses = courses;
      calculateHomeScreenData();
      emit(GetAllCoursesSuccess());
    }
  }

  Future<List<CourseModel>> getSemesterCourses(int semesterId) async {
    final List<CourseModel> courses =
        await _getSemesterCoursesUseCase.call(semesterId);
    return courses;
  }

  Future<void> updateCourse(CourseModel course) async {
    final bool result = await _updateCourseUseCase.call(course);
    if (result) {
      final index = allCourses.indexWhere((course) => course.id == course.id);
      if (index != -1) {
        allCourses[index] = course;
        calculateHomeScreenData();
      }
      emit(UpdateCourseSuccess());
    }
  }

  Future<void> deleteCourse(int courseId) async {
    final bool result = await _deleteCourseUseCase.call(courseId);
    if (result) {
      allCourses.removeWhere((course) => course.id == courseId);
      calculateHomeScreenData();
      emit(DeleteCourseSuccess());
    }
  }
}
