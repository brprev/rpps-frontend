import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/law_entity.dart';
import '../repositories/i_laws_repository.dart';

class UpdateLawParams extends Equatable {
  final LawEntity law;

  @override
  List get props => [law];

  const UpdateLawParams({
    required this.law,
  });
}

class UpdateLawUseCase implements IUseCase<void, UpdateLawParams> {
  final ILawsRepository _repository;

  UpdateLawUseCase({
    required ILawsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(UpdateLawParams param) {
    return _repository.updateLaw(param.law);
  }
}
