import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/business_entity.dart';
import '../repositories/i_business_entities_repository.dart';

class DeleteBusinessEntityUseCase
    implements IUseCase<void, DeleteBusinessEntitiesParams> {
  final IBusinessEntitiesRepository _repository;

  DeleteBusinessEntityUseCase({
    required IBusinessEntitiesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(DeleteBusinessEntitiesParams params) {
    return _repository.deleteEntity(params.entity);
  }
}

class DeleteBusinessEntitiesParams extends Equatable {
  final BusinessEntity entity;

  @override
  List get props => [entity];

  const DeleteBusinessEntitiesParams(this.entity);
}
