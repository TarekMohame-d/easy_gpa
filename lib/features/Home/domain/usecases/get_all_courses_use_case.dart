import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class GetAllCoursesUseCase {
  final HomeRepo _homeRepo;

  GetAllCoursesUseCase(this._homeRepo);

  Future<RepoResult<List<CourseModel>>> call() async =>
      await _homeRepo.getAllCourses();
}
