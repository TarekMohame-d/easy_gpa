import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class InsertCourseUseCase {
  final CoursesRepo _coursesRepo;

  InsertCourseUseCase(this._coursesRepo);
  Future<bool> call(CourseModel course) async {
    return await _coursesRepo.insertCourse(course);
  }
}
