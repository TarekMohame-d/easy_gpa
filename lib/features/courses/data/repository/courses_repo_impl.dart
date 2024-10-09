import 'package:easy_gpa/core/helpers/extensions.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class CoursesRepoImpl implements CoursesRepo {
  CoursesRepoImpl(this._coursesLocalDataSource);

  final CoursesLocalDataSource _coursesLocalDataSource;

  @override
  Future<bool> insertCourse(CourseModel course) async {
    return await SQLHelper.insert(course.toMap());
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
}
