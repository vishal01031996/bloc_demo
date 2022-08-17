import 'package:bloc_demo/service/responce/number_responce.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: "http://numbersapi.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/{number}?json')
  @MultiPart()
  Future<NumberResponce> getResultbyNumber(@Path("number") String number);

  @GET('/random/trivia?json')
  Future<NumberResponce> getRandomResult();
}
