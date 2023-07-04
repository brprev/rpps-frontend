import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../extensions/sized_box_extension.dart';
import '../../theme/constants/app_sizes.dart';
import '../atoms/button_widget.dart';
import '../atoms/search_filter_widget.dart';
import '../atoms/table_widget.dart';
import '../molecules/page_header_widget.dart';
import '../molecules/search_and_filter_widget.dart';

class PageWithTableTemplate extends StatelessWidget {
  const PageWithTableTemplate({
    super.key,
    required this.title,
    required this.onSearch,
    required this.tableColumns,
    required this.tableRows,
    this.actions = const <ButtonWidget>[],
    this.filters = const <SearchFilterWidget>[],
  });

  final String title;
  final List<ButtonWidget> actions;
  final List<SearchFilterWidget> filters;
  final void Function(String) onSearch;
  final List<PlutoColumn> tableColumns;
  final List<PlutoRow> tableRows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppSizes.s32),
      child: Column(
        children: [
          PageHeaderWidget(title: title, actions: actions),
          VerticalSpace.s40,
          SearchAndFilterWidget(
            onSearch: onSearch,
            filters: filters,
          ),
          VerticalSpace.s40,
          Expanded(
            child: TableWidget(
              rows: tableRows,
              columns: tableColumns,
            ),
          ),
        ],
      ),
    );
  }
}
