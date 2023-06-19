import '../entities/account_entity.dart';

abstract class ISignInDataSource {
  Future<AccountEntity> signIn(String email, String password);
}
