import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract class IAppColorPalette {
  late ColorScheme colorScheme;
}

class AppColorPalette implements IAppColorPalette {
  @override
  late ColorScheme colorScheme;

  AppColorPalette() {
    colorScheme = const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      error: AppColors.error,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
      onSecondary: Colors.black,
      primary: Colors.grey,
      secondary: Colors.grey,
      surface: Colors.white,
    );
  }
}
