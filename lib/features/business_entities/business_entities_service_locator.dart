import 'package:get_it/get_it.dart';

import 'data/data_sources/business_entities_data_source.dart';
import 'data/repositories/business_entities_repository.dart';
import 'domain/repositories/i_business_entities_repository.dart';
import 'domain/use_cases/create_business_entity_use_case.dart';
import 'domain/use_cases/delete_business_entity_use_case.dart';
import 'domain/use_cases/edit_business_entity_use_case.dart';
import 'domain/use_cases/get_business_entities_use_case.dart';
import 'presentation/pages/business_entity_page/business_entities_cubit.dart';

Future<void> initFeatureBusinessEntities(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<IBusinessEntitiesDataSource>(
    () => BusinessEntitiesDataSource(httpClient: sl()),
  );

  // Repositories
  sl.registerLazySingleton<IBusinessEntitiesRepository>(
    () => BusinessEntitiesRepository(dataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => CreateBusinessEntityUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteBusinessEntityUseCase(repository: sl()));
  sl.registerLazySingleton(() => EditBusinessEntityUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBusinessEntitiesUseCase(repository: sl()));

  // Cubits
  sl.registerLazySingleton(
    () => BusinessEntitiesCubit(
      createBusinessEntityUseCase: sl(),
      deleteBusinessEntityUseCase: sl(),
      editBusinessEntityUseCase: sl(),
      getBusinessEntitiesUseCase: sl(),
    ),
  );
}
