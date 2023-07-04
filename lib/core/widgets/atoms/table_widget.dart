import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../theme/constants/app_colors.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({
    Key? key,
    required this.rows,
    required this.columns,
  }) : super(key: key);

  final List<PlutoRow> rows;
  final List<PlutoColumn> columns;

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: widget.columns,
      rows: widget.rows,
      mode: PlutoGridMode.readOnly,
      configuration: const PlutoGridConfiguration(
        style: PlutoGridStyleConfig(
          oddRowColor: Colors.white,
          evenRowColor: AppColors.primary,
          enableColumnBorderVertical: false,
          enableCellBorderVertical: false,
          enableGridBorderShadow: false,
        ),
        columnSize: PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.scale,
        ),
      ),
      onChanged: (PlutoGridOnChangedEvent event) => print(event),
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
      },
    );
  }
}
