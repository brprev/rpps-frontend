import '../../../../core/http/http_enums.dart';
import '../../../../core/http/i_http_client.dart';
import '../../domain/data_sources/i_sign_in_data_source.dart';
import '../../domain/entities/account_entity.dart';
import '../model/sign_in_model.dart';

class SignInDataSource implements ISignInDataSource {
  final IHttpClient _httpClient;

  SignInDataSource({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<AccountEntity> signIn(String email, String password) async {
    final response = await _httpClient.request(
      url: '/v1/authentication/login',
      method: HttpMethod.post,
      body: {
        'login': email,
        'senha': password,
      },
    );

    return SignInModel.fromJson(response).toEntity();
  }
}
