import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';

class GetSemesterCoursesUseCase {
  final CoursesRepo _coursesRepo;

  GetSemesterCoursesUseCase(this._coursesRepo);
  Future<List<CourseModel>> call(int semesterId) async {
    return _coursesRepo.getSemesterCourses(semesterId);
  }
}
