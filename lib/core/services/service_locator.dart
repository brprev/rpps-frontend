import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../http/http_client.dart';
import '../http/i_http_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Infra
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<IHttpClient>(
    () => HttpClient(
      client: sl(),
      baseUrl: 'http://api.openrpps.com:8080/api',
    ),
  );

  // Data sources

  // Repositories

  // Use cases

  // Cubits
}
