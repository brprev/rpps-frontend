import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';

TextStyle _getTextStyle(
  Color color,
  double fontSize,
  FontWeight fontWeight,
) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getLightStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.light);

TextStyle getRegularStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.regular);

TextStyle getMediumStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.medium);

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.semiBold);

TextStyle getBoldStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.bold);

TextStyle getExtraBoldStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.extraBold);

TextStyle getBlackStyle({
  required Color color,
  double fontSize = AppFontSizes.s12,
}) =>
    _getTextStyle(color, fontSize, AppFontWeights.black);
