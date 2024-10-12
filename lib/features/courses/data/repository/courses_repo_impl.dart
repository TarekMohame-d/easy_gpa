import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class CoursesRepoImpl implements CoursesRepo {
  CoursesRepoImpl(this._coursesLocalDataSource);

  final CoursesLocalDataSource _coursesLocalDataSource;

  @override
  Future<bool> insertCourse(CourseModel course) async {
    return await _coursesLocalDataSource.insertCourse(course);
  }

  @override
  Future<List<CourseModel>> getAllCourses() async {
    List<Map<String, dynamic>> courses =
        await _coursesLocalDataSource.getAllCourses();
    List<CourseModel>? coursesList;
    if (courses.isNotEmpty) {
      coursesList = courses.map((e) => CourseModel.fromMap(e)).toList();
    }
    return coursesList.isNullOrEmpty() ? [] : coursesList!;
  }

  @override
  Future<List<CourseModel>> getSemesterCourses(int semesterId) async {
    List<Map<String, dynamic>> courses =
        await _coursesLocalDataSource.getSemesterCourses(semesterId);
    List<CourseModel>? coursesList;
    if (courses.isNotEmpty) {
      coursesList = courses.map((e) => CourseModel.fromMap(e)).toList();
    }
    return coursesList.isNullOrEmpty() ? [] : coursesList!;
  }

  @override
  Future<bool> updateCourse(CourseModel course) async {
    return await _coursesLocalDataSource.updateCourse(course);
  }

  @override
  Future<bool> deleteCourse(int courseId) async {
    return await _coursesLocalDataSource.deleteCourse(courseId);
  }
}
