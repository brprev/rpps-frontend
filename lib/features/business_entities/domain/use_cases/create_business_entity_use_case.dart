import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/business_entity.dart';
import '../repositories/i_business_entities_repository.dart';

class CreateBusinessEntityUseCase
    implements IUseCase<void, CreateBusinessEntitiesParams> {
  final IBusinessEntitiesRepository _repository;

  CreateBusinessEntityUseCase({
    required IBusinessEntitiesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(CreateBusinessEntitiesParams params) {
    return _repository.createEntity(params.newEntity);
  }
}

class CreateBusinessEntitiesParams extends Equatable {
  final BusinessEntity newEntity;

  @override
  List get props => [newEntity];

  const CreateBusinessEntitiesParams(this.newEntity);
}
