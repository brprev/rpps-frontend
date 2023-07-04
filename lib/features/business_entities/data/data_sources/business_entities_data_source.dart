import '../../../../core/http/http_enums.dart';
import '../../../../core/http/i_http_client.dart';
import '../../domain/entities/business_entity.dart';
import '../../domain/use_cases/get_business_entities_use_case.dart';

abstract class IBusinessEntitiesDataSource {
  Future<void> createEntity(BusinessEntity entity);
  Future<void> deleteEntity(BusinessEntity entity);
  Future<void> editEntity(BusinessEntity entity);
  Future<List<BusinessEntity>> getEntities(GetBusinessEntitiesParams params);
}

class BusinessEntitiesDataSource implements IBusinessEntitiesDataSource {
  final IHttpClient _httpClient;

  BusinessEntitiesDataSource({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<void> createEntity(BusinessEntity entity) async {
    await _httpClient.request(
      url: '/v1/ente',
      method: HttpMethod.post,
      body: {
        'numero_ibge': 0,
        'cnpj': 'string',
        'nome': 'string',
        'endereco': 'string',
        'numero': 0,
        'complemento': 'string',
        'bairro': 'string',
        'cidade': 'string',
        'uf': 'string',
        'cep': 'string',
        'email': 'string',
      },
    );
  }

  @override
  Future<void> deleteEntity(BusinessEntity entity) async {
    // TODO: implement deleteEntity
    throw UnimplementedError();
  }

  @override
  Future<void> editEntity(BusinessEntity entity) async {
    // TODO: implement editEntity
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessEntity>> getEntities(
    GetBusinessEntitiesParams params,
  ) async {
    // TODO: implement getEntities
    throw UnimplementedError();
  }
}
