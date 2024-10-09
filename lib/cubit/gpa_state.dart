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

final class UpdateHomeScreenData extends GpaState {}

final class UpdateSemestersCardData extends GpaState {}
