import 'package:get_it/get_it.dart';

import 'data/data_sources/sign_in_data_source.dart';
import 'data/repositories/sign_in_repository.dart';
import 'domain/data_sources/i_sign_in_data_source.dart';
import 'domain/repositories/i_sign_in_repository.dart';
import 'domain/use_cases/sign_in_use_case.dart';
import 'presentation/pages/sign_in_page/sign_in_cubit.dart';

Future<void> initFeatureAuth(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<ISignInDataSource>(
    () => SignInDataSource(httpClient: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ISignInRepository>(
    () => SignInRepository(dataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(repository: sl()));

  // Cubits
  sl.registerLazySingleton(() => SignInCubit(signInUseCase: sl()));
}
