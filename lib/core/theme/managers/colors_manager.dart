import 'package:flutter/material.dart';

abstract class IAppColors {
  late ColorScheme colorScheme;
}

class AppColors implements IAppColors {
  @override
  late ColorScheme colorScheme;

  AppColors() {
    colorScheme = const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      error: Colors.red,
      onBackground: Colors.white,
      onError: Colors.white,
      onInverseSurface: Colors.white,
      onPrimary: Colors.black,
      onPrimaryContainer: Colors.white,
      onSurface: Colors.black,
      onSecondary: Colors.pink,
      onSecondaryContainer: Colors.pink,
      onSurfaceVariant: Colors.pink,
      onTertiary: Colors.pink,
      onTertiaryContainer: Colors.pink,
      outline: Colors.black,
      primary: Colors.blueGrey,
      secondary: Colors.pink,
      surface: Colors.pink,
      surfaceVariant: Colors.pink,
    );
  }
}
