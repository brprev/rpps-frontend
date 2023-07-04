import 'package:flutter/material.dart';

import '../data/text_theme.dart';
import 'colors_manager.dart';

ThemeData createTheme() {
  final appColors = AppColorPalette();

  return ThemeData(
    brightness: appColors.colorScheme.brightness,
    colorScheme: appColors.colorScheme,
    primaryColor: appColors.colorScheme.primary,
    scaffoldBackgroundColor: appColors.colorScheme.background,
    textTheme: textTheme(appColors),
    // textButtonTheme: textButtonTheme(appColors),
    // elevatedButtonTheme: elevatedButtonTheme(appColors),
    // TODO:
    // appBarTheme: _appBarTheme(appColors),
    // popupMenuTheme: _popupMenuThemeData(appColors),
    // inputDecorationTheme: _inputDecorationTheme(appColors),
    // dividerColor: appColors.colorScheme!.secondaryContainer,
  );
}
