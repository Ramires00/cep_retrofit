import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/model.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'https://viacep.com.br/ws/')
abstract class Repository {
  factory Repository(Dio dio, {String baseUrl}) = _Repository;

  @GET("/{cep}/json")
  Future<Locate> getCep(@Path("cep") String cep);
}
