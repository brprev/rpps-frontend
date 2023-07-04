import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ISignInRepository {
  Future<Either<Failure, bool>> getLoginStatus();
  Future<Either<Failure, bool>> signIn(String email, String password);
}
