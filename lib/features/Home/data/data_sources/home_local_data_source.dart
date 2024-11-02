import 'package:easy_gpa/core/helpers/sql_helper.dart';

class HomeLocalDataSource {
  Future<List<Map<String, dynamic>>> getAllCourses() async {
    return await SQLHelper.getAllDBItems();
  }
}
