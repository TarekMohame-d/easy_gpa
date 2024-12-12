import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/helper_functions.dart';
import 'package:easy_gpa/features/Home/domain/usecases/save_pdf_use_case.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/usecases/delete_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/insert_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/update_course_use_case.dart';
import 'package:easy_gpa/features/home/domain/usecases/get_all_courses_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit(
    this._insertCourseUseCase,
    this._getAllCoursesUseCase,
    this._updateCourseUseCase,
    this._deleteCourseUseCase,
    this._savePdfUseCase,
  ) : super(GpaInitial());

  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final InsertCourseUseCase _insertCourseUseCase;
  final UpdateCourseUseCase _updateCourseUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;
  final SavePdfUseCase _savePdfUseCase;

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

  void calculateGradesStatistics() {
    gradesStatistics.updateAll((key, value) => 0);
    for (var course in allCourses) {
      if (gradesStatistics.containsKey(course.grade)) {
        gradesStatistics[course.grade] = gradesStatistics[course.grade]! + 1;
      }
    }
  }

  (double? gpa, int? creditHours) calculateSemesterData(int semesterId) {
    List<CourseModel> semesterCourses = getSemesterCourses(semesterId);

    if (semesterCourses.isNullOrEmpty()) return (null, null);
    double qualityPoints = 0;
    for (var course in semesterCourses) {
      qualityPoints +=
          course.credits * KHelperFunctions.convertGradeToNumber(course.grade);
    }
    int creditHours =
        semesterCourses.fold(0, (sum, course) => sum + course.credits);
    double gpa = qualityPoints / creditHours;

    return (gpa, creditHours);
  }

  void calculateAllCreditHours() {
    allCreditHours = 0;
    allCreditHours = allCourses.fold(0, (sum, course) => sum + course.credits);
  }

  void calculateCGPA() {
    cGPA = 0.0;
    if (allCourses.isEmpty) {
      return;
    }

    double qualityPoints = 0;
    for (var course in allCourses) {
      qualityPoints +=
          course.credits * KHelperFunctions.convertGradeToNumber(course.grade);
    }
    cGPA = allCreditHours > 0 ? qualityPoints / allCreditHours : 0.0;
  }

  void calculateHomeScreenData() {
    calculateAllCreditHours();
    calculateCGPA();
    calculateGradesStatistics();
  }

  Future<void> insertCourse(CourseModel course) async {
    emit(InsertCourseLoading());
    final (bool, int?) result = await _insertCourseUseCase.call(course);
    if (result.$1) {
      allCourses.add(CourseModel(
        credits: course.credits,
        grade: course.grade,
        name: course.name,
        semester: course.semester,
        id: result.$2,
      ));
      calculateHomeScreenData();
      emit(InsertCourseSuccess());
    } else {
      emit(InsertCourseFailure());
    }
  }

  Future<void> updateCourse(CourseModel editedCourse) async {
    emit(UpdateCourseLoading());
    final result = await _updateCourseUseCase.call(editedCourse);
    if (result) {
      final index =
          allCourses.indexWhere((course) => course.id == editedCourse.id);
      if (index != -1) {
        allCourses[index] = editedCourse;
        calculateHomeScreenData();
      }
      emit(UpdateCourseSuccess());
    } else {
      emit(UpdateCourseFailure());
    }
  }

  Future<void> deleteCourse(int courseId) async {
    emit(DeleteCourseLoading());
    final result = await _deleteCourseUseCase.call(courseId);
    if (result) {
      allCourses.removeWhere((course) => course.id == courseId);
      calculateHomeScreenData();
      emit(DeleteCourseSuccess());
    } else {
      emit(DeleteCourseFailure());
    }
  }

  Future<void> getAllCourses() async {
    emit(GetAllCoursesLoading());
    final courses = await _getAllCoursesUseCase.call();
    if (courses.isNotEmpty) {
      allCourses = courses;
      calculateHomeScreenData();
      emit(GetAllCoursesSuccess());
    }
  }

  List<CourseModel> getSemesterCourses(int semesterId) {
    final List<CourseModel> semesterCourses =
        allCourses.where((course) => course.semester == semesterId).toList();
    return semesterCourses;
  }

  Future<void> generateAndSavePdf() async {
    emit(SavePdfLoading());
    final result = await _savePdfUseCase.call(allCourses, cGPA, allCreditHours);
    if (result.$1) {
      emit(SavePdfSuccess(result.$2));
    } else {
      emit(SavePdfFailure(result.$2));
    }
  }
}
