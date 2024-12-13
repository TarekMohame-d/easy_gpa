import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class UpdateCourseUseCase {
  final CoursesRepo _coursesRepo;

  UpdateCourseUseCase(this._coursesRepo);

  Future<RepoResult<bool>> call(CourseModel course) async {
    return await _coursesRepo.updateCourse(course);
  }
}
