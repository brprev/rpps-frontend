import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/business_entity.dart';
import '../../domain/repositories/i_business_entities_repository.dart';
import '../../domain/use_cases/get_business_entities_use_case.dart';
import '../data_sources/business_entities_data_source.dart';

class BusinessEntitiesRepository implements IBusinessEntitiesRepository {
  final IBusinessEntitiesDataSource _dataSource;

  BusinessEntitiesRepository({
    required IBusinessEntitiesDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, bool>> createEntity(BusinessEntity entity) async {
    try {
      await _dataSource.createEntity(entity);

      return const Right(true);
    } catch (_) {
      return const Left(
        ServerFailure('Erro ao cadastrar um novo ente'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEntity(BusinessEntity entity) async {
    try {
      await _dataSource.deleteEntity(entity);

      return const Right(true);
    } catch (_) {
      return const Left(
        ServerFailure('Erro ao excluir um ente'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> editEntity(BusinessEntity entity) async {
    try {
      await _dataSource.editEntity(entity);

      return const Right(true);
    } catch (_) {
      return const Left(
        ServerFailure('Erro ao editar um ente'),
      );
    }
  }

  @override
  Future<Either<Failure, List<BusinessEntity>>> getEntities(
    GetBusinessEntitiesParams params,
  ) async {
    try {
      final results = await _dataSource.getEntities(params);

      return Right(results);
    } catch (_) {
      return const Left(
        ServerFailure('Erro ao recuperar entes'),
      );
    }
  }
}
