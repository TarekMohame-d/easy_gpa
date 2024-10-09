import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

late int numOfSemesters;

class SharedPrefKeys {
  static const String numberOfSemesters = 'numberOfSemesters';
}
