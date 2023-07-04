import '../../../../core/http/http_enums.dart';
import '../../../../core/http/i_http_client.dart';
import '../model/sign_in_model.dart';

abstract class ISignInDataSource {
  Future<bool> getLoginStatus();
  Future<bool> signIn(String email, String password);
}

class SignInDataSource implements ISignInDataSource {
  final IHttpClient _httpClient;

  SignInDataSource({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<bool> signIn(String email, String password) async {
    final response = await _httpClient.request(
      url: '/v1/authentication/login',
      method: HttpMethod.post,
      body: {
        'login': email,
        'senha': password,
      },
    );

    final model = SignInModel.fromJson(response);
    if (model.token.isEmpty) return false;

    _httpClient.saveToken(model.token);

    return getLoginStatus();
  }

  @override
  Future<bool> getLoginStatus() async {
    final token = await _httpClient.getToken() ?? '';

    return token.isNotEmpty;
  }
}
