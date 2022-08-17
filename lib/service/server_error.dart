import 'package:dio/dio.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";

  ServerError.withError({required DioError error}) {
    _handleError(error);
    // Utils.hideLoader(Get.context!);
    // Utils.showToast(getErrorMessage());
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Something went wrong";
        break;
      case DioErrorType.response:
        _errorMessage =
            "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Something went wrong";
        break;
      case DioErrorType.other:
        _errorMessage = "Something went wrong";
        break;
    }
    return _errorMessage;
  }
}
