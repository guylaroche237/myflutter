

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/api_error_types.dart';

class ParseError extends AbstractApiError{
  String message = "Unable to parse the body of the request";
  ParseError({this.message}) : super(0,message, ApiErrorType.parseError);
}