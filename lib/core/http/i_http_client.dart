import 'http_enums.dart';

abstract class IHttpClient {
  Future<dynamic> request({
    required String url,
    required HttpMethod method,
    Map? body,
    Map? headers,
  });

  Future<void> saveToken(String token);

  Future<void> removeToken();

  Future<String?> getToken();
}
