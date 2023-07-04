import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/i_usecase.dart';
import '../../../domain/entities/law_entity.dart';
import '../../../domain/use_cases/create_law_use_case.dart';
import '../../../domain/use_cases/delete_law_use_case.dart';
import '../../../domain/use_cases/get_laws_use_case.dart';
import '../../../domain/use_cases/update_law_use_case.dart';

enum ManageLawsPageState { empty, loading, error, loaded }

class ManageLawsCubit extends Cubit<ManageLawsPageState> {
  ManageLawsCubit({
    required CreateLawUseCase createLawUseCase,
    required DeleteLawsUseCase deleteLawsUseCase,
    required GetLawsUseCase getLawsUseCase,
    required UpdateLawUseCase updateLawUseCase,
  })  : _createLawUseCase = createLawUseCase,
        _deleteLawsUseCase = deleteLawsUseCase,
        _getLawsUseCase = getLawsUseCase,
        _updateLawUseCase = updateLawUseCase,
        super(ManageLawsPageState.loading);

  late List<LawEntity> laws;

  final CreateLawUseCase _createLawUseCase;
  final DeleteLawsUseCase _deleteLawsUseCase;
  final GetLawsUseCase _getLawsUseCase;
  final UpdateLawUseCase _updateLawUseCase;

  static ManageLawsCubit get(context) => BlocProvider.of(context);

  void onInit(BuildContext context) async {
    laws = <LawEntity>[];

    emit(ManageLawsPageState.loading);

    await _getLaws();

    emit(ManageLawsPageState.loaded);
  }

  Future<void> _getLaws() async {
    laws.clear();

    const params = NoParams();
    final result = await _getLawsUseCase(params);

    result.fold((l) => null, (r) => laws.addAll(r));
  }

  Future<bool> _createLaw(String lawId) async {
    return true;
  }

  Future<bool> _updateLaw(String lawId) async {
    return true;
  }

  Future<bool> _deleteLaws(String lawId) async {
    return true;
  }
}
