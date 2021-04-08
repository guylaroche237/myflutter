import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';

class FindAllCommandeRequest extends AbstractApiRequest{

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/commandes";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    throw UnimplementedError();
  }

}