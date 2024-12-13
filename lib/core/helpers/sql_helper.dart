import 'package:flutter/material.dart';
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
      debugPrint("Error while initializing database: $e");
    }
  }

  /// Add Item
  static Future<int> insert(Map<String, Object?> values) async {
    try {
      int index = await _db!.insert(
        _tableName,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return index;
    } catch (e) {
      debugPrint("Error while inserting: $e");
      throw Exception("Error while inserting: $e");
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
      debugPrint("Error while retrieving: $e");
      throw Exception("Error while retrieving: $e");
    }
  }

  /// Retrieve All Items
  static Future<List<Map<String, dynamic>>> getAllDBItems() async {
    try {
      return await _db!.query(_tableName);
    } catch (e) {
      debugPrint("Error while retrieving: $e");
      throw Exception("Error while retrieving all items: $e");
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
      debugPrint("Error while Updating: $e");
      throw Exception("Error while Updating: $e");
    }
  }

  /// Delete Item
  static Future<bool> delete(int id) async {
    try {
      int count = await _db!.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return count > 0;
    } catch (e) {
      debugPrint("Error while deleting: $e");
      throw Exception("Error while deleting: $e");
    }
  }

  /// Clear DataBase
  static Future<bool> clear() async {
    try {
      int count = await _db!.delete(_tableName);
      return count > 0;
    } catch (e) {
      debugPrint("Error while clearing: $e");
      throw Exception("Error while clearing database: $e");
    }
  }

  /// Close the database
  static Future<void> closeDB() async {
    await _db!.close();
  }
}
