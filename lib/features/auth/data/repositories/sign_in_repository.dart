import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_enums.dart';
import '../../../../core/http/http_mixins.dart';
import '../../domain/repositories/i_sign_in_repository.dart';
import '../data_sources/sign_in_data_source.dart';

class SignInRepository with HttpMixins implements ISignInRepository {
  final ISignInDataSource _dataSource;

  SignInRepository({
    required ISignInDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, bool>> signIn(String email, String password) async {
    try {
      final signInResult = await _dataSource.signIn(email, password);

      return Right(signInResult);
    } on HttpError catch (error) {
      return Left(
        ServerFailure(
          handleWithHttpErrorOnRequest(error),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getLoginStatus() async {
    try {
      final userIsLogged = await _dataSource.getLoginStatus();

      return Right(userIsLogged);
    } catch (_) {
      return const Left(
        CachedFailure('Erro ao recuperar token de acesso'),
      );
    }
  }
}
