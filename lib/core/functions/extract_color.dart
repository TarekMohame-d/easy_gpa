import 'package:flutter/material.dart';

List<Color> getBackGroundColor(List<String> colorsList,
    {double opacity = 1.0}) {
  return colorsList.map((hexColor) {
    int colorWithoutAlpha = int.parse('0xFF${hexColor.substring(0, 6)}');
    return Color(colorWithoutAlpha).withOpacity(opacity);
  }).toList();
}
