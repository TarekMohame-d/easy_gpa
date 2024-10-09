import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Database? _db;
  static const String _dbName = 'easy_gpa.db';
  static const String _tableName = 'Courses';

  /// Initialize the database
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
              credits INTEGER,
              semester INTEGER
            )
          ''');
        },
      );
    } catch (e) {
      log("Error while initializing database: $e");
    }
  }

  /// Add Item
  static Future<bool> insert(Map<String, Object?> values) async {
    try {
      await _db!.insert(
        _tableName,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      log("Error while inserting: $e");
      return false;
    }
  }

  /// Retrieve All Semester Items
  static Future<List<Map<String, dynamic>>> getItems(int whereArgs) async {
    try {
      return await _db!.query(
        _tableName,
        where: 'semester = ?',
        whereArgs: [whereArgs],
      );
    } catch (e) {
      log("Error while retrieving: $e");
      return [];
    }
  }

  /// Retrieve All Items
  static Future<List<Map<String, dynamic>>> getAllDBItems() async {
    try {
      return await _db!.query(_tableName);
    } catch (e) {
      log("Error while retrieving: $e");
      return [];
    }
  }

  /// Update Item
  static Future<bool> update(Map<String, Object?> values) async {
    try {
      await _db!.update(
        _tableName,
        {
          'name': values['name'],
          'grade': values['grade'],
          'credits': values['credits'],
          'semester': values['semester']
        },
        where: 'id = ?',
        whereArgs: [values['id']],
      );
      return true;
    } catch (e) {
      log("Error while Updating: $e");
      return false;
    }
  }

  /// Delete Item
  static Future<bool> delete(int id) async {
    try {
      await _db!.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      log("Error while deleting: $e");
      return false;
    }
  }

  /// Clear DataBase
  static Future<bool> clear() async {
    try {
      await _db!.delete(_tableName);
      return true;
    } catch (e) {
      log("Error while clearing: $e");
      return false;
    }
  }

  /// Close the database
  static Future<void> closeDB() async {
    await _db!.close();
  }
}
