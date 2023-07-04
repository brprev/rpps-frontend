import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/law_entity.dart';
import '../repositories/i_laws_repository.dart';

class GetLawsUseCase implements IUseCase<void, NoParams> {
  final ILawsRepository _repository;

  GetLawsUseCase({
    required ILawsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<LawEntity>>> call(NoParams params) {
    return _repository.getLaws();
  }
}
