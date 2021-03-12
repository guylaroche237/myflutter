

import 'abstract_api_request.dart';
import 'abstract_api_response.dart';

abstract class AbstractApiClient{
  Future<AbstractApiResponse>process(AbstractApiRequest request);
}