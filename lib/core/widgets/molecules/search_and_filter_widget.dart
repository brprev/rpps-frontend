import 'package:flutter/material.dart';

import '../../theme/constants/app_sizes.dart';
import '../atoms/search_bar_widget.dart';
import '../atoms/search_filter_widget.dart';

class SearchAndFilterWidget extends StatelessWidget {
  const SearchAndFilterWidget({
    super.key,
    required this.onSearch,
    required this.filters,
  });

  final void Function(String) onSearch;
  final List<SearchFilterWidget> filters;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SearchBarWidget(
            hintText: 'Pesquisar por ...',
            onSearch: onSearch,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(
            filters.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: AppSizes.s16),
              child: filters[index],
            ),
          ),
        ),
      ],
    );
  }
}
