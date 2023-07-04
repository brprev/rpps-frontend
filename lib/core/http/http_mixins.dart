import 'http_enums.dart';

mixin HttpMixins {
  String handleWithHttpErrorOnRequest(HttpError type) {
    final httpErros = <HttpError, String>{
      HttpError.badRequest: 'bad request',
      HttpError.forbidden: 'forbidden',
      HttpError.invalidData: 'invalid data',
      HttpError.notFound: 'not found',
      HttpError.unauthorized: 'unauthorized',
    };

    return httpErros[type] ?? '';
  }
}
