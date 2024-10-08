import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Database? _db;
  static const String _dbName = 'easy_gpa.db';
  static const String _tableName = 'Courses';

  // Initialize the database
  static Future<void> initDB() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = '$dbPath/$_dbName';

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              grade TEXT,
              semester INTEGER
            )
          ''');
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  /// Add new Item
  static Future<int> insertCourse(Map<String, Object?> values) async {
    return await _db!.insert(
      _tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieve Courses by semester
  static Future<List<Map<String, dynamic>>> getCoursesBySemester(
      int semester) async {
    return await _db!
        .query(_tableName, where: 'semester = ?', whereArgs: [semester]);
  }

  // Update a subject
  static Future<void> updateSubject(Map<String, Object?> values) async {
    await _db!.update(
      _tableName,
      {
        'name': values['name'],
        'grade': values['grade'],
        'semester': values['semester']
      },
      where: 'id = ?',
      whereArgs: [values['id']],
    );
  }

  /// Delete a subject
  static Future<void> deleteSubject(int id) async {
    await _db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete all subjects
  static Future<void> deleteAllSubjects() async {
    await _db!.delete(_tableName);
  }

  /// Close the database
  static Future<void> closeDB() async {
    await _db!.close();
  }
}
