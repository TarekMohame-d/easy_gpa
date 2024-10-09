import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class GetAllCoursesUseCase {
  final CoursesRepo _coursesRepo;

  GetAllCoursesUseCase(this._coursesRepo);
  Future<List<CourseModel>> call() async {
    return await _coursesRepo.getAllCourses();
  }
}
