import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../../core/mixins/table_mixin.dart';
import '../../../../core/widgets/atoms/button_widget.dart';
import '../../../../core/widgets/atoms/search_filter_widget.dart';
import '../../../../core/widgets/templates/page_with_table_template.dart';
import '../../domain/entities/business_entity.dart';

class BusinessEntitiesTableWidget extends StatelessWidget with TableMixin {
  const BusinessEntitiesTableWidget({
    super.key,
    required this.onPressedCell,
    required this.onPressedCreateEntity,
    required this.onPressedDeleteEntity,
    required this.onSearch,
    required this.entities,
  });

  final void Function(PlutoCell) onPressedCell;
  final void Function(String) onSearch;
  final VoidCallback onPressedDeleteEntity;
  final VoidCallback onPressedCreateEntity;
  final List<BusinessEntity> entities;

  @override
  Widget build(BuildContext context) {
    final tableColumns = <PlutoColumn>[
      buildTableColumn(
        title: 'Ente',
        field: 'name',
        enableCheckBox: true,
        onPressedCell: onPressedCell,
      ),
      buildTableColumn(title: 'Unidade gestora', field: 'managementUnit'),
      buildTableColumn(title: 'Última atualização', field: 'updateAt'),
    ];

    final tableRows = entities.map((entity) {
      return PlutoRow(
        cells: {
          'name': PlutoCell(value: entity.name),
          'managementUnit': PlutoCell(value: entity.managementUnit),
          'updateAt': PlutoCell(value: entity.updateAt),
        },
      );
    }).toList();

    return PageWithTableTemplate(
      title: 'Gerenciar entes',
      actions: [
        ButtonWidget(text: 'deletar', onPressed: onPressedDeleteEntity),
        ButtonWidget.info(text: 'criar ente', onPressed: onPressedCreateEntity),
      ],
      onSearch: onSearch,
      filters: [
        SearchFilterWidget.filter(onPressed: () => print('filter')),
        SearchFilterWidget.sortUpdateAt(onPressed: () => print('sort')),
      ],
      tableRows: tableRows,
      tableColumns: tableColumns,
    );
  }
}
