part of 'gpa_cubit.dart';

@immutable
sealed class GpaState {}

final class GpaInitial extends GpaState {}

final class GetAllCoursesLoading extends GpaState {}

final class GetAllCoursesSuccess extends GpaState {}

final class GetAllCoursesFailure extends GpaState {}

final class InsertCourseLoading extends GpaState {}

final class InsertCourseSuccess extends GpaState {}

final class InsertCourseFailure extends GpaState {}

final class UpdateCourseLoading extends GpaState {}

final class UpdateCourseSuccess extends GpaState {}

final class UpdateCourseFailure extends GpaState {}

final class DeleteCourseLoading extends GpaState {}

final class DeleteCourseSuccess extends GpaState {}

final class DeleteCourseFailure extends GpaState {}



final class UpdateSemesterGPA extends GpaState {}

final class FilterSemesterCourses extends GpaState {}

final class GetSemesterCoursesSuccess extends GpaState {}



final class SavePdfSuccess extends GpaState {}

final class SavePdfFailure extends GpaState {}
