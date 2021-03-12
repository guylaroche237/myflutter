

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/api_error_types.dart';

class GenericError extends AbstractApiError{
  String message;
  int code = 6;
  GenericError(this.message,{this.code}) : super(code, message, ApiErrorType.genericError);
}