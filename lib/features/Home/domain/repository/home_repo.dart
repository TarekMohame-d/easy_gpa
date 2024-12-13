import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

abstract class HomeRepo {
  Future<RepoResult<String>> generateAndSavePdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  );

  Future<RepoResult<List<CourseModel>>> getAllCourses();
}
