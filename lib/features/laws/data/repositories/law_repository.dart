import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/law_entity.dart';
import '../../domain/repositories/i_laws_repository.dart';
import '../data_sources/laws_data_source.dart';

class LawsRepository implements ILawsRepository {
  LawsRepository({
    required ILawsDataSource dataSource,
  }) : _dataSource = dataSource;

  final ILawsDataSource _dataSource;

  @override
  Future<Either<Failure, bool>> createLaw(LawEntity law) async {
    // TODO: implement createLaw
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteLaw(LawEntity law) {
    // TODO: implement deleteLaw
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LawEntity>>> getLaws() {
    // TODO: implement getLaws
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateLaw(LawEntity law) {
    // TODO: implement updateLaw
    throw UnimplementedError();
  }
}
