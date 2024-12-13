import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class DeleteCourseUseCase {
  final CoursesRepo _coursesRepo;
  DeleteCourseUseCase(this._coursesRepo);

  Future<RepoResult<bool>> call(int courseId) async {
    return await _coursesRepo.deleteCourse(courseId);
  }
}
