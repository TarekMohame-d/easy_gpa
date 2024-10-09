import 'package:easy_gpa/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:easy_gpa/features/courses/data/repository/courses_repo_impl.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';
import 'package:easy_gpa/features/courses/domain/usecases/filter_semester_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/insert_course_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<CoursesLocalDataSource>(
      () => CoursesLocalDataSource());
  getIt.registerLazySingleton<CoursesRepo>(() => CoursesRepoImpl(getIt()));
  getIt.registerLazySingleton<InsertCourseUseCase>(
      () => InsertCourseUseCase(getIt()));

  getIt.registerLazySingleton<GetAllCoursesUseCase>(
      () => GetAllCoursesUseCase(getIt()));

  getIt.registerLazySingleton<FilterSemesterCoursesUseCase>(
      () => FilterSemesterCoursesUseCase());
}
