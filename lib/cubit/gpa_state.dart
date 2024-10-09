part of 'gpa_cubit.dart';

@immutable
sealed class GpaState {}

final class GpaInitial extends GpaState {}

final class AddSemesterSuccess extends GpaState {}

final class AddSemesterFailure extends GpaState {}
