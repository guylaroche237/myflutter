
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/api_error_types.dart';
class NetworkError extends AbstractApiError{
  String message =  "Network error. please check your internet connection";
  NetworkError({this.message}) : super(1,message, ApiErrorType.networkError);
}