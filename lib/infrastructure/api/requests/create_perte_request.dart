import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';

class CreatePerteRequest extends AbstractApiRequest{

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/pertes";
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