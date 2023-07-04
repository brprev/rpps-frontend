import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../theme/constants/app_colors.dart';

mixin TableMixin {
  PlutoColumn buildTableColumn({
    required String title,
    required String field,
    bool enableCheckBox = false,
    PlutoColumnTextAlign textCellAlign = PlutoColumnTextAlign.start,
    PlutoColumnTextAlign titleCellAlign = PlutoColumnTextAlign.start,
    void Function(PlutoCell)? onPressedCell,
  }) {
    return PlutoColumn(
      title: title.toUpperCase(),
      field: field,
      type: PlutoColumnType.text(),
      backgroundColor: AppColors.primary,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableDropToResize: false,
      enableEditingMode: false,
      enableFilterMenuItem: false,
      enableHideColumnMenuItem: false,
      enableRowChecked: enableCheckBox,
      enableSetColumnsMenuItem: false,
      enableSorting: false,
      readOnly: true,
      suppressedAutoSize: false,
      textAlign: textCellAlign,
      titleTextAlign: titleCellAlign,
      renderer: (rendererContext) {
        return onPressedCell != null
            ? GestureDetector(
                onTap: () => onPressedCell(rendererContext.cell),
                child: Text(
                  rendererContext.cell.value,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            : Text(rendererContext.cell.value);
      },
    );
  }
}
