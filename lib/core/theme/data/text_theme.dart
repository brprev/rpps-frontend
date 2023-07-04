import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import '../managers/colors_manager.dart';
import '../managers/text_styles.dart';

TextTheme textTheme(IAppColorPalette appColors) {
  return TextTheme(
    // Display Theme
    // headline1
    displayLarge: getExtraBoldStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s24,
    ),
    // headline2
    displayMedium: getLightStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s48,
    ),
    // headline3
    displaySmall: getBlackStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s14,
    ),
    // Headline Theme
    headlineLarge: getBoldStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s18,
    ),
    // headline4
    headlineMedium: getMediumStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s11,
    ),
    // headline5
    headlineSmall: getSemiBoldStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s10,
    ),
    // Title Theme
    titleLarge: getMediumStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s17,
    ),
    titleMedium: getMediumStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s14,
    ),
    titleSmall: getSemiBoldStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s14,
    ),
    // Body Theme
    bodyMedium: getMediumStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s14,
    ),
    bodySmall: getRegularStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s12,
    ),
    // Label Theme
    labelLarge: getBoldStyle(
      color: appColors.colorScheme.onBackground,
      fontSize: AppFontSizes.s14,
    ),
  );
}
