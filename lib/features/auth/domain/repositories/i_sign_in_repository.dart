import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/account_entity.dart';

abstract class ISignInRepository {
  Future<Either<Failure, AccountEntity>> signIn(String email, String password);
}
