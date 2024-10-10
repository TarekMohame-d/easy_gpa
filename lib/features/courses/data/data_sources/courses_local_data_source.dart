import 'package:easy_gpa/core/helpers/sql_helper.dart';

class CoursesLocalDataSource {
  Future<List<Map<String, dynamic>>> getAllCourses() async {
    return SQLHelper.getAllDBItems();
  }

  Future<List<Map<String, dynamic>>> getSemesterCourses(int semesterId) async {
    return SQLHelper.getItems(semesterId);
  }
}
