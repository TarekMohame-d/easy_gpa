import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class UpdateCourseUseCase {
  final CoursesRepo _coursesRepo;

  UpdateCourseUseCase(this._coursesRepo);

  Future<bool> call(CourseModel course) async {
    return await _coursesRepo.updateCourse(course);
  }
}
