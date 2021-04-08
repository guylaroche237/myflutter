import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';

class CreateVenteRequest extends AbstractApiRequest{

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/ventes";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "POST";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    throw UnimplementedError();
  }

}