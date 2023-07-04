import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/law_entity.dart';

abstract class ILawsRepository {
  Future<Either<Failure, bool>> createLaw(LawEntity law);

  Future<Either<Failure, bool>> deleteLaw(LawEntity law);

  Future<Either<Failure, List<LawEntity>>> getLaws();

  Future<Either<Failure, bool>> updateLaw(LawEntity law);
}
