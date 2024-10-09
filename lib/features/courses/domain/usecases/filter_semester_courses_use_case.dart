import 'package:easy_gpa/features/courses/data/models/course_model.dart';

class FilterSemesterCoursesUseCase {
  List<CourseModel> call(List<CourseModel> courses, int semesterId) {
    return courses.where((element) => element.semester == semesterId).toList();
  }
}
