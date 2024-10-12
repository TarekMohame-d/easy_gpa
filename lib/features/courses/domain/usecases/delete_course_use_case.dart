import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class DeleteCourseUseCase {
  final CoursesRepo _coursesRepo;
  DeleteCourseUseCase(this._coursesRepo);

  Future<bool> call(int courseId) async {
    return await _coursesRepo.deleteCourse(courseId);
  }
}
