import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../theme/constants/app_colors.dart';
import '../../theme/constants/app_fonts.dart';
import '../../theme/constants/app_sizes.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blueGrey,
  });

  factory ButtonWidget.error({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ButtonWidget(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.error,
    );
  }

  factory ButtonWidget.info({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ButtonWidget(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.info,
    );
  }

  factory ButtonWidget.success({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ButtonWidget(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.success,
    );
  }

  final Color backgroundColor;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s8),
        ),
        textStyle: TextStyle(
          color: context.colorScheme.onSecondary,
          fontWeight: AppFontWeights.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.s16,
          vertical: AppSizes.s8,
        ),
      ),
      onPressed: onPressed,
      child: Text(text.toUpperCase()),
    );
  }
}
