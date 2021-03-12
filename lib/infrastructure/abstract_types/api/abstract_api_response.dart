  
import 'package:http/http.dart';

import 'abstract_api_error.dart';
abstract class AbstractApiResponse{
  final Response httpResponse;
  AbstractApiResponse(this.httpResponse);

  bool hasError();
  AbstractApiError get error;
  dynamic get data;
}