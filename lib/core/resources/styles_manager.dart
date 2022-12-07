import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'values_manager.dart';
import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontName) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontName,
  );
}

TextStyle getLightStyle({
  double fontSize = DoubleManager.d_2,
  Color color = ColorsManager.mainWhiteColor,
  required String fontName,
}) {
  return _getTextStyle(fontSize, FontsWeightManager.light, color, fontName);
}

TextStyle getRegularStyle({
  double fontSize = DoubleManager.d_2,
  Color color = ColorsManager.mainWhiteColor,
  required String fontName,
}) {
  return _getTextStyle(fontSize, FontsWeightManager.regular, color, fontName);
}

TextStyle getMediumStyle({
  double fontSize = DoubleManager.d_2,
  Color color = ColorsManager.mainWhiteColor,
  required String fontName,
}) {
  return _getTextStyle(fontSize, FontsWeightManager.medium, color, fontName);
}

TextStyle getSemiBoldStyle({
  double fontSize = DoubleManager.d_2,
  Color color = ColorsManager.mainWhiteColor,
  required String fontName,
}) {
  return _getTextStyle(fontSize, FontsWeightManager.semiBold, color, fontName);
}

TextStyle getBoldStyle({
  double fontSize = DoubleManager.d_2,
  Color color = ColorsManager.mainWhiteColor,
  required String fontName,
}) {
  return _getTextStyle(fontSize, FontsWeightManager.bold, color, fontName);
}
