import 'package:easy_gpa/features/courses/data/models/course_model.dart';

abstract class SemestersRepo {
  List<CourseModel> getSemesterCourse(
      List<CourseModel> allCourses, int semesterId);
}
