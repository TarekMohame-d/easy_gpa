import 'package:easy_gpa/core/helpers/sql_helper.dart';

class HomeDataSource {
  Future<List<Map<String, dynamic>>> getAllCourses() async {
    return await SQLHelper.getAllDBItems();
  }
}
