import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import '../managers/colors_manager.dart';
import '../managers/text_styles.dart';

TextTheme textTheme(IAppColors appColors) {
  return TextTheme(
    // Display Theme
    // headline1
    displayLarge: getExtraBoldStyle(
      color: appColors.colorScheme.onPrimary,
      fontSize: AppFontSizes.s24,
    ),
    // headline2
    displayMedium: getExtraBoldStyle(
      color: appColors.colorScheme.onPrimary,
      fontSize: AppFontSizes.s20,
    ),
    // headline3
    displaySmall: getBlackStyle(
      color: appColors.colorScheme.onPrimary,
      fontSize: AppFontSizes.s14,
    ),
    // Headline Theme
    headlineLarge: getBoldStyle(
      color: appColors.colorScheme.onPrimary,
      fontSize: AppFontSizes.s18,
    ),
    // headline4
    headlineMedium: getMediumStyle(
      color: appColors.colorScheme.onSurface,
      fontSize: AppFontSizes.s11,
    ),
    // headline5
    headlineSmall: getSemiBoldStyle(
      color: appColors.colorScheme.onSurface,
      fontSize: AppFontSizes.s10,
    ),
    // Title Theme
    titleLarge: getMediumStyle(
      color: appColors.colorScheme.onSurface,
      fontSize: AppFontSizes.s17,
    ),
    titleMedium: getMediumStyle(
      color: appColors.colorScheme.onInverseSurface,
      fontSize: AppFontSizes.s14,
    ),
    titleSmall: getSemiBoldStyle(
      color: appColors.colorScheme.onSurfaceVariant,
      fontSize: AppFontSizes.s14,
    ),
    // Body Theme
    bodyMedium: getMediumStyle(
      color: appColors.colorScheme.onInverseSurface,
      fontSize: AppFontSizes.s14,
    ),
    bodySmall: getRegularStyle(
      color: appColors.colorScheme.primaryContainer,
      fontSize: AppFontSizes.s12,
    ),
    // Label Theme
    labelLarge: getBoldStyle(
      color: appColors.colorScheme.onPrimary,
      fontSize: AppFontSizes.s14,
    ),
  );
}
