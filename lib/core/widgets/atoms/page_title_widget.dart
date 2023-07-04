import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../theme/constants/app_colors.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.displayMedium?.copyWith(
        color: AppColors.pageTitle,
      ),
    );
  }
}
