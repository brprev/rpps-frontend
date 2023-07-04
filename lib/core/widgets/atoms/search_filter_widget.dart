import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../theme/constants/app_colors.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title;

  factory SearchFilterWidget.filter({required VoidCallback onPressed}) {
    return SearchFilterWidget(
      icon: Icons.filter_alt_sharp,
      title: 'filtrar',
      onPressed: onPressed,
    );
  }

  factory SearchFilterWidget.sortUpdateAt({required VoidCallback onPressed}) {
    return SearchFilterWidget(
      icon: Icons.format_align_justify,
      title: 'mais recentes',
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.pageTitle),
      label: Text(
        title.toUpperCase(),
        style: context.bodyMedium?.copyWith(
          color: AppColors.pageTitle,
        ),
      ),
    );
  }
}
