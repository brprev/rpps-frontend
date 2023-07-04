import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/business_entity.dart';
import '../repositories/i_business_entities_repository.dart';

class EditBusinessEntityUseCase
    implements IUseCase<void, EditBusinessEntitiesParams> {
  final IBusinessEntitiesRepository _repository;

  EditBusinessEntityUseCase({
    required IBusinessEntitiesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(EditBusinessEntitiesParams params) {
    return _repository.editEntity(params.entity);
  }
}

class EditBusinessEntitiesParams extends Equatable {
  final BusinessEntity entity;

  @override
  List get props => [entity];

  const EditBusinessEntitiesParams(this.entity);
}
