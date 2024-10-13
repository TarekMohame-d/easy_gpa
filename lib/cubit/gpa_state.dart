part of 'gpa_cubit.dart';

@immutable
sealed class GpaState {}

final class GpaInitial extends GpaState {}

final class AddCourseLoading extends GpaState {}

final class AddCourseSuccess extends GpaState {}

final class AddCourseFailure extends GpaState {}

final class GetAllCoursesLoading extends GpaState {}

final class GetAllCoursesSuccess extends GpaState {}

final class GetAllCoursesFailure extends GpaState {}

final class UpdateSemesterGPA extends GpaState {}

final class FilterSemesterCourses extends GpaState {}

final class GetSemesterCoursesSuccess extends GpaState {}

final class UpdateCourseSuccess extends GpaState {}

final class DeleteCourseSuccess extends GpaState {}

final class SavePdfSuccess extends GpaState {}

final class SavePdfFailure extends GpaState {}
