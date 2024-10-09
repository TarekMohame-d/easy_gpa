import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

late double cGPA;
late int allCreditHours;

class SharedPrefKeys {
  static const String cGPA = 'cGPA';
   static const String allCreditHours = 'allCreditHours';
}
