import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/semesters/domain/repository/semesters_repo.dart';

class SemestersRepoImpl implements SemestersRepo {
  @override
  List<CourseModel> getSemesterCourse(
      List<CourseModel> allCourses, int semesterId) {
    final List<CourseModel> courses =
        allCourses.where((course) => course.semester == semesterId).toList();
    return courses;
  }
}
