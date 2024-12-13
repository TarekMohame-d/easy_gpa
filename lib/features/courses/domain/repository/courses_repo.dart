import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

abstract class CoursesRepo {
  Future<RepoResult<int>> insertCourse(CourseModel course);
  Future<RepoResult<bool>> updateCourse(CourseModel course);
  Future<RepoResult<bool>> deleteCourse(int courseId);
}
