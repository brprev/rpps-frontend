// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:html' as html;

import 'package:http/http.dart';

import 'http_enums.dart';
import 'i_http_client.dart';

class HttpClient implements IHttpClient {
  HttpClient({
    required Client client,
    String baseUrl = '',
  })  : _client = client,
        _baseUrl = baseUrl;

  final String _baseUrl;
  final Client _client;

  @override
  Future<void> removeToken() async {
    html.window.localStorage.remove('accessToken');
  }

  @override
  Future<dynamic> request({
    required String url,
    required HttpMethod method,
    Map? body,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {};
    defaultHeaders.addAll({
      'content-type': 'application/json',
      'accept': 'application/json',
    });

    String token = await getToken() ?? '';
    token.isNotEmpty
        ? defaultHeaders.addAll({'Authorization': 'Bearer $token'})
        : _refreshPage();

    final jsonBody = body != null ? jsonEncode(body) : null;
    final uriPath = Uri.parse(_baseUrl + url);
    final httpRequestsMap = <HttpMethod, Future<Response>>{
      HttpMethod.get: _client.get(uriPath),
      HttpMethod.post: _client.post(
        uriPath,
        headers: defaultHeaders,
        body: jsonBody,
      ),
      HttpMethod.put: _client.put(
        uriPath,
        headers: defaultHeaders,
        body: jsonBody,
      ),
    };

    Response response = Response('', 500);

    try {
      Future<Response>? futureResponse = httpRequestsMap[method];

      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 5));
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  @override
  Future<void> saveToken(String token) async {
    html.window.localStorage.clear();
    html.window.localStorage['accessToken'] = token;
  }

  @override
  Future<String?> getToken() async {
    final token = html.window.localStorage['accessToken'] ?? '';
    // TODO: return _isTokenExpired(token) ? null : token;

    return token;
  }

  void _refreshPage() {
    html.window.location.reload();
  }

  bool _isTokenExpired(String jwtToken) {
    final parts = jwtToken.split('.');
    if (parts.length != 3) return true;

    final payload = parts[1];
    String decodedPayload;
    try {
      decodedPayload = String.fromCharCodes(
        base64Url.decode(base64Url.normalize(payload)),
      );
    } catch (_) {
      return true;
    }

    final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;
    if (!payloadMap.containsKey('exp')) return true;

    final exp = payloadMap['exp'] as int;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return now >= exp;
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
