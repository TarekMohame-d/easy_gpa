import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value) {
      case String _:
        await sharedPreferences.setString(key, value);
        break;
      case int _:
        await sharedPreferences.setInt(key, value);
        break;
      case bool _:
        await sharedPreferences.setBool(key, value);
        break;
      case double _:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        log('SharedPrefHelper : setData with key : $key and value : $value is not supported');
        break;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool(String key) async {
    log('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble(String key) async {
    log('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt(String key) async {
    log('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static Future<String> getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log('SharedPrefHelper : getString with key : $key and value : ${sharedPreferences.getString(key)}');
    return sharedPreferences.getString(key) ?? '';
  }
}
