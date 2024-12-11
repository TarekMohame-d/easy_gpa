import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class CoursesDataSource {
  Future<(bool, int?)> insertCourse(CourseModel course) async {
    return await SQLHelper.insert(course.toMap());
  }

  Future<bool> updateCourse(CourseModel course) async {
    return await SQLHelper.update(course.toMap());
  }

  Future<bool> deleteCourse(int courseId) async {
    return await SQLHelper.delete(courseId);
  }
}
