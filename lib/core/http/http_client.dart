import 'dart:convert';

import 'package:http/http.dart';

import 'http_enums.dart';
import 'i_http_client.dart';

class HttpClient implements IHttpClient {
  final Client _client;
  final String _baseUrl;

  HttpClient({
    required Client client,
    String baseUrl = '',
  })  : _client = client,
        _baseUrl = baseUrl;

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
