import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class CoursesLocalDataSource {
  Future<(bool, int?)> insertCourse(CourseModel course) async {
    return await SQLHelper.insert(course.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllCourses() async {
    return await SQLHelper.getAllDBItems();
  }

  Future<List<Map<String, dynamic>>> getSemesterCourses(int semesterId) async {
    return await SQLHelper.getItems(semesterId);
  }

  Future<bool> updateCourse(CourseModel course) async {
    return await SQLHelper.update(course.toMap());
  }

  Future<bool> deleteCourse(int courseId) async {
    return await SQLHelper.delete(courseId);
  }
}
