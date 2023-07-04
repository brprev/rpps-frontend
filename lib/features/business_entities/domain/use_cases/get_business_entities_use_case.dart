import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../entities/business_entity.dart';
import '../repositories/i_business_entities_repository.dart';

class GetBusinessEntitiesUseCase
    implements IUseCase<void, GetBusinessEntitiesParams> {
  final IBusinessEntitiesRepository _repository;

  GetBusinessEntitiesUseCase({
    required IBusinessEntitiesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<BusinessEntity>>> call(
    GetBusinessEntitiesParams params,
  ) {
    return _repository.getEntities(params);
  }
}

class GetBusinessEntitiesParams extends Equatable {
  /// Selects resource fields
  final List<String> fields;

  /// Adds search condition
  final String search;

  /// Adds filter condition
  final List<String> filter;

  /// Adds OR condition
  final List<String> or;

  /// Adds sort by field
  final List<String> sort;

  /// Adds relational resources
  final List<String> join;

  /// Limit amount of resources
  final int limit;

  /// Offset amount of resources
  final int offset;

  /// Page portion of resources
  final int page;

  @override
  List get props => [];

  const GetBusinessEntitiesParams({
    this.fields = const <String>[],
    this.search = '',
    this.filter = const <String>[],
    this.or = const <String>[],
    this.sort = const <String>[],
    this.join = const <String>[],
    this.limit = 20,
    this.offset = 0,
    this.page = 1,
  });
}
