import 'package:easy_gpa/features/courses/data/data_sources/courses_data_source.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class CoursesRepoImpl implements CoursesRepo {
  CoursesRepoImpl(this._coursesLocalDataSource);

  final CoursesDataSource _coursesLocalDataSource;

  @override
  Future<(bool, int?)> insertCourse(CourseModel course) async {
    return await _coursesLocalDataSource.insertCourse(course);
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
