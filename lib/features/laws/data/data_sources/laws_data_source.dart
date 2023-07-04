import '../../domain/entities/law_entity.dart';

abstract class ILawsDataSource {
  Future<bool> createLaw();

  Future<bool> deleteLaw();

  Future<List<LawEntity>> getLaws();

  Future<bool> updateLaw();
}

class LawsDataSource implements ILawsDataSource {
  @override
  Future<bool> createLaw() {
    // TODO: implement createLaw
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteLaw() {
    // TODO: implement deleteLaw
    throw UnimplementedError();
  }

  @override
  Future<List<LawEntity>> getLaws() {
    // TODO: implement getLaws
    throw UnimplementedError();
  }

  @override
  Future<bool> updateLaw() {
    // TODO: implement updateLaw
    throw UnimplementedError();
  }
}
