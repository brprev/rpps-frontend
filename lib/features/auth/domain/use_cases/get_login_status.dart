import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../repositories/i_sign_in_repository.dart';

class GetLoginStatusUseCase implements IUseCase<void, NoParams> {
  final ISignInRepository _repository;

  GetLoginStatusUseCase({
    required ISignInRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.getLoginStatus();
  }
}
