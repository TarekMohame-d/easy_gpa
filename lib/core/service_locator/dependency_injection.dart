import 'package:easy_gpa/features/Home/data/data_sources/home_data_source.dart';
import 'package:easy_gpa/features/Home/data/repository/home_repo_impl.dart';
import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/Home/domain/usecases/save_pdf_use_case.dart';
import 'package:easy_gpa/features/courses/data/data_sources/courses_data_source.dart';
import 'package:easy_gpa/features/courses/data/repository/courses_repo_impl.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';
import 'package:easy_gpa/features/courses/domain/usecases/delete_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/insert_course_use_case.dart';
import 'package:easy_gpa/features/courses/domain/usecases/update_course_use_case.dart';
import 'package:easy_gpa/features/home/domain/usecases/get_all_courses_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource());

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));

  getIt.registerLazySingleton<GetAllCoursesUseCase>(
      () => GetAllCoursesUseCase(getIt()));

  getIt.registerLazySingleton<SavePdfUseCase>(() => SavePdfUseCase(getIt()));

  getIt.registerLazySingleton<CoursesDataSource>(() => CoursesDataSource());

  getIt.registerLazySingleton<CoursesRepo>(() => CoursesRepoImpl(getIt()));

  getIt.registerLazySingleton<InsertCourseUseCase>(
      () => InsertCourseUseCase(getIt()));

  getIt.registerLazySingleton<UpdateCourseUseCase>(
      () => UpdateCourseUseCase(getIt()));

  getIt.registerLazySingleton<DeleteCourseUseCase>(
      () => DeleteCourseUseCase(getIt()));
}
