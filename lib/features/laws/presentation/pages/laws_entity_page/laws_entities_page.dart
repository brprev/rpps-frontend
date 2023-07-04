import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../../../core/mixins/table_mixin.dart';
import '../../../../../core/widgets/atoms/button_widget.dart';
import '../../../../../core/widgets/atoms/search_filter_widget.dart';
import '../../../../../core/widgets/templates/page_with_table_template.dart';
import '../../../domain/entities/law_entity.dart';

class ManageLawsPage extends StatelessWidget with TableMixin {
  const ManageLawsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final laws = [
      LawEntity(
        id: '11',
        isActive: true,
        name: 'nome lei',
        type: LawType.stateLaw,
      ),
      LawEntity(
        id: '22',
        isActive: true,
        name: 'nome lei',
        type: LawType.stateLaw,
      ),
      LawEntity(
        id: '33',
        isActive: true,
        name: 'nome lei',
        type: LawType.stateLaw,
      ),
      LawEntity(
        id: '44',
        isActive: true,
        name: 'nome lei',
        type: LawType.stateLaw,
      ),
    ];

    final tableColumns = <PlutoColumn>[
      buildTableColumn(title: 'Número', field: 'id', enableCheckBox: true),
      buildTableColumn(title: 'Nome', field: 'name'),
      buildTableColumn(title: 'Tipo', field: 'type'),
      buildTableColumn(title: 'Vigência', field: 'isActive'),
    ];

    final List<PlutoRow> tableRows = laws.map((law) {
      return PlutoRow(
        cells: {
          'id': PlutoCell(value: law.id),
          'name': PlutoCell(value: law.name),
          'type': PlutoCell(value: law.type.name),
          'isActive': PlutoCell(value: law.isActive.toString()),
        },
      );
    }).toList();

    return Scaffold(
      body: PageWithTableTemplate(
        title: 'Gerenciar leis',
        actions: [
          ButtonWidget(text: 'deletar', onPressed: () => print('delete')),
          ButtonWidget.info(text: 'nova lei', onPressed: () => print('nova')),
        ],
        onSearch: (value) => print(value),
        filters: [
          SearchFilterWidget.filter(onPressed: () => print('filtro')),
          SearchFilterWidget.sortUpdateAt(onPressed: () => print('sort')),
        ],
        tableRows: tableRows,
        tableColumns: tableColumns,
      ),
    );
  }
}
