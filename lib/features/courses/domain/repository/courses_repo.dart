import 'package:easy_gpa/features/courses/data/models/course_model.dart';

abstract class CoursesRepo {
  Future<(bool, int?)> insertCourse(CourseModel course);
  Future<List<CourseModel>> getAllCourses();
  Future<List<CourseModel>> getSemesterCourses(int semesterId);
  Future<bool> updateCourse(CourseModel course);
  Future<bool> deleteCourse(int courseId);
}
