import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/law_entity.dart';
import '../repositories/i_laws_repository.dart';

class DeleteLawParams extends Equatable {
  final LawEntity law;

  @override
  List get props => [law];

  const DeleteLawParams({
    required this.law,
  });
}

class DeleteLawsUseCase implements IUseCase<void, DeleteLawParams> {
  final ILawsRepository _repository;

  DeleteLawsUseCase({
    required ILawsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(DeleteLawParams param) {
    return _repository.deleteLaw(param.law);
  }
}
