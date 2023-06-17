import 'http_enums.dart';

abstract class IHttpClient {
  Future<dynamic> request({
    required String url,
    required HttpMethod method,
    Map? body,
    Map? headers,
  });
}
