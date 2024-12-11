import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/semesters/domain/repository/semesters_repo.dart';

class GetSemesterCoursesUseCase {
  final SemestersRepo _semestersRepo;

  GetSemesterCoursesUseCase(this._semestersRepo);

  List<CourseModel> call(List<CourseModel> allCourses, int semesterId) {
    return _semestersRepo.getSemesterCourse(allCourses, semesterId);
  }
}
