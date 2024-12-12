import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class SavePdfUseCase {
  final HomeRepo _homeRepo;

  SavePdfUseCase(this._homeRepo);
  Future<(bool success, String errorMessage)> call(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) async {
    return _homeRepo.generateAndSavePdf(courses, cGPA, allCreditHours);
  }
}
