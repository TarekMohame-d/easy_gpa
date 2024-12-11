import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class GetAllCoursesUseCase {
  final HomeRepo _homeRepo;

  GetAllCoursesUseCase(this._homeRepo);

  Future<List<CourseModel>> call() async => _homeRepo.getAllCourses();
}
