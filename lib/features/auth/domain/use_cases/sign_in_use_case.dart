import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../repositories/i_sign_in_repository.dart';

class SignInParams extends Equatable {
  final String email;
  final String password;

  @override
  List get props => [email, password];

  const SignInParams({
    required this.email,
    required this.password,
  });
}

class SignInUseCase implements IUseCase<void, SignInParams> {
  final ISignInRepository _repository;

  SignInUseCase({
    required ISignInRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(SignInParams params) {
    return _repository.signIn(params.email, params.password);
  }
}
