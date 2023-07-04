import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/mixins/table_mixin.dart';
import '../../widgets/business_entities_table_widget.dart';
import '../../widgets/business_entity_entry_widget.dart';
import 'business_entities_cubit.dart';

class BusinessEntitiesPage extends StatelessWidget with TableMixin {
  const BusinessEntitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BusinessEntitiesCubit, EntitiesPageState>(
        builder: (context, state) {
          final cubit = BusinessEntitiesCubit.get(context);

          final pageState = <EntitiesPageState, Widget>{
            EntitiesPageState.empty: const Icon(Icons.question_mark),
            EntitiesPageState.error: const Icon(Icons.close),
            EntitiesPageState.loading: const CircularProgressIndicator(),
            EntitiesPageState.table: BusinessEntitiesTableWidget(
              entities: cubit.entities,
              onPressedCell: cubit.onPressedCell,
              onPressedCreateEntity: cubit.onPressedToCreateEntity,
              onPressedDeleteEntity: () => print('delete cell'),
              onSearch: (value) => print(value),
            ),
            EntitiesPageState.entry: BusinessEntityEntryWidget(
              // entity: cubit.currentEntity,
              onPressedCancel: cubit.showTable,
              onPressedCreateEntity: cubit.onPressedCreateEntity,
            ),
          };

          return pageState[state] ?? const SizedBox.shrink();
        },
      ),
    );
  }
}
