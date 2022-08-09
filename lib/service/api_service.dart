import 'package:bloc_demo/service/apiclient.dart';
import 'package:bloc_demo/service/responce/base_responce.dart';
import 'package:bloc_demo/service/responce/number_responce.dart';
import 'package:bloc_demo/service/server_error.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:dio/dio.dart';

class ApiServices {
  ApiClient apiClient = ApiClient(Dio(BaseOptions(
      connectTimeout: 100000,
      receiveTimeout: 120000,
      contentType: "application/json")));

  Future<BaseResponse<NumberResponce>> insertNumber(String number) async {
    var responce;

    try {
      responce = await apiClient.getResultbyNumber(number);
    } catch (error, stacktrace) {
      if (error is DioError) {
        return BaseResponse()
          ..setException(ServerError.withError(error: error as DioError));
      } else {
        Utils.showToast(error.toString());
      }
    }
    return BaseResponse()..data = responce;
  }

  Future<BaseResponse<NumberResponce>> randomnumber() async {
    var responce;

    try {
      responce = await apiClient.getRandomResult();
    } catch (error, stacktrace) {
      if (error is DioError) {
        return BaseResponse()
          ..setException(ServerError.withError(error: error as DioError));
      } else {
        Utils.showToast(error.toString());
      }
    }
    return BaseResponse()..data = responce;
  }
}
