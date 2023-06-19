import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_enums.dart';
import '../../../../core/http/http_mixins.dart';
import '../../domain/data_sources/i_sign_in_data_source.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/i_sign_in_repository.dart';

class SignInRepository with HttpMixins implements ISignInRepository {
  final ISignInDataSource _dataSource;

  SignInRepository({
    required ISignInDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, AccountEntity>> signIn(
    String email,
    String password,
  ) async {
    try {
      final account = await _dataSource.signIn(email, password);

      return Right(account);
    } on HttpError catch (error) {
      return Left(
        ServerFailure(
          handleWithHttpErrorOnRequest(error),
        ),
      );
    }
  }
}
