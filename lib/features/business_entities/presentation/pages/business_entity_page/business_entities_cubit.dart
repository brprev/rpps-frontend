import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../domain/entities/business_entity.dart';
import '../../../domain/use_cases/create_business_entity_use_case.dart';
import '../../../domain/use_cases/delete_business_entity_use_case.dart';
import '../../../domain/use_cases/edit_business_entity_use_case.dart';
import '../../../domain/use_cases/get_business_entities_use_case.dart';

enum EntitiesPageState { empty, loading, error, table, entry }

class BusinessEntitiesCubit extends Cubit<EntitiesPageState> {
  BusinessEntitiesCubit({
    required CreateBusinessEntityUseCase createBusinessEntityUseCase,
    required DeleteBusinessEntityUseCase deleteBusinessEntityUseCase,
    required EditBusinessEntityUseCase editBusinessEntityUseCase,
    required GetBusinessEntitiesUseCase getBusinessEntitiesUseCase,
  })  : _createBusinessEntityUseCase = createBusinessEntityUseCase,
        _deleteBusinessEntityUseCase = deleteBusinessEntityUseCase,
        _editBusinessEntityUseCase = editBusinessEntityUseCase,
        _getBusinessEntitiesUseCase = getBusinessEntitiesUseCase,
        super(EntitiesPageState.table);

  final fakeEntity = BusinessEntity(
    name: 'name',
    ownerName: 'ownerName',
    ownerPhone: 'ownerPhone',
    managementUnit: 'managementUnit',
  );

  late GetBusinessEntitiesParams getParams;

  final CreateBusinessEntityUseCase _createBusinessEntityUseCase;
  final DeleteBusinessEntityUseCase _deleteBusinessEntityUseCase;
  final EditBusinessEntityUseCase _editBusinessEntityUseCase;
  final GetBusinessEntitiesUseCase _getBusinessEntitiesUseCase;

  final List<BusinessEntity> entities = [
    BusinessEntity(
      name: 'Nome do ente',
      ownerName: 'Responsável',
      ownerPhone: 'xx xxxxx-xxxx',
      managementUnit: 'Unidade gestora',
      updateAt: 'now',
    ),
    BusinessEntity(
      name: 'Nome do ente',
      ownerName: 'Responsável',
      ownerPhone: 'xx xxxxx-xxxx',
      managementUnit: 'Unidade gestora',
      updateAt: 'now',
    ),
    BusinessEntity(
      name: 'Nome do ente',
      ownerName: 'Responsável',
      ownerPhone: 'xx xxxxx-xxxx',
      managementUnit: 'Unidade gestora',
      updateAt: 'now',
    ),
  ];

  static BusinessEntitiesCubit get(context) => BlocProvider.of(context);

  void onInit(BuildContext context) async {
    emit(EntitiesPageState.loading);

    getParams = const GetBusinessEntitiesParams();
    await _getBusinessEntities();

    emit(EntitiesPageState.table);
  }

  void updateGetParams(GetBusinessEntitiesParams newParams) {
    getParams = newParams;
  }

  Future<void> onPressedDeleteEntity(BusinessEntity entity) async {
    await _deleteBusinessEntities(entity);
  }

  void onPressedCreateEntity() {
    emit(EntitiesPageState.table);
  }

  void onPressedToCreateEntity() {
    emit(EntitiesPageState.entry);
    // await _createBusinessEntity(entity);
  }

  void onPressedCell(PlutoCell cell) {
    emit(EntitiesPageState.entry);
    // await _editBusinessEntity(entity);
  }

  void showTable() => emit(EntitiesPageState.table);

  Future<void> onPressedEditEntity(BusinessEntity entity) async {
    await _editBusinessEntities(entity);
  }

  Future<void> _getBusinessEntities() async {
    final result = await _getBusinessEntitiesUseCase(getParams);
    result.fold((l) => null, (r) => null);
  }

  Future<void> _editBusinessEntities(BusinessEntity entity) async {
    final param = EditBusinessEntitiesParams(entity);
    final result = await _editBusinessEntityUseCase(param);
    result.fold((l) => null, (r) => null);
  }

  Future<void> _deleteBusinessEntities(BusinessEntity entity) async {
    final param = DeleteBusinessEntitiesParams(entity);
    final result = await _deleteBusinessEntityUseCase(param);
    result.fold((l) => null, (r) => null);
  }

  Future<void> _createBusinessEntity(BusinessEntity entity) async {
    final param = CreateBusinessEntitiesParams(entity);
    final result = await _createBusinessEntityUseCase(param);
    result.fold((l) => null, (r) => null);
  }
}
