import 'package:easy_gpa/features/courses/data/models/course_model.dart';

abstract class HomeRepo {
  Future<bool> generateAndSavePdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  );

  Future<List<CourseModel>> getAllCourses();
}
