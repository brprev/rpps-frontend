import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/business_entity.dart';
import '../use_cases/get_business_entities_use_case.dart';

abstract class IBusinessEntitiesRepository {
  Future<Either<Failure, bool>> createEntity(BusinessEntity entity);

  Future<Either<Failure, bool>> deleteEntity(BusinessEntity entity);

  Future<Either<Failure, bool>> editEntity(BusinessEntity entity);

  Future<Either<Failure, List<BusinessEntity>>> getEntities(
    GetBusinessEntitiesParams params,
  );
}
