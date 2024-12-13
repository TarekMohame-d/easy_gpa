import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:easy_gpa/features/courses/domain/repository/courses_repo.dart';
import 'package:flutter/material.dart';

class CoursesRepoImpl implements CoursesRepo {
  @override
  Future<RepoResult<int>> insertCourse(CourseModel course) async {
    try {
      final result = await SQLHelper.insert(course.toMap());
      return RepoResult.success(result);
    } catch (e) {
      debugPrint("Error while Inserting: $e");
      return RepoResult.failure('Error while Inserting: $e');
    }
  }

  @override
  Future<RepoResult<bool>> updateCourse(CourseModel course) async {
    try {
      final result = await SQLHelper.update(course.toMap());
      return RepoResult.success(result);
    } catch (e) {
      debugPrint("Error while Updating: $e");
      return RepoResult.failure('Error while Updating: $e');
    }
  }

  @override
  Future<RepoResult<bool>> deleteCourse(int courseId) async {
    try {
      final result = await SQLHelper.delete(courseId);
      return RepoResult.success(result);
    } catch (e) {
      debugPrint("Error while Deleting: $e");
      return RepoResult.failure('Error while Deleting: $e');
    }
  }
}
