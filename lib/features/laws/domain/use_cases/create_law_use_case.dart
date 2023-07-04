import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/law_entity.dart';
import '../repositories/i_laws_repository.dart';

class LawParams extends Equatable {
  final String id;
  final String name;
  final LawType type;
  final bool isActive;

  @override
  List get props => [id, name, type, isActive];

  const LawParams({
    required this.id,
    required this.name,
    required this.type,
    required this.isActive,
  });
}

class CreateLawUseCase implements IUseCase<void, LawParams> {
  final ILawsRepository _repository;

  CreateLawUseCase({
    required ILawsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(LawParams law) {
    return _repository.createLaw(
      LawEntity(
        id: law.id,
        name: law.name,
        type: law.type,
        isActive: law.isActive,
      ),
    );
  }
}
