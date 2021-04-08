import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';

class FindFournisseurByIdRequest extends AbstractApiRequest{
  final String id;

  FindFournisseurByIdRequest(this.id);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return " /api/fournisseurs/"+id;
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }
  @override
  Map<String, String> getParams() {
    // TODO: implement getParams
    return {
      "id":id
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    throw UnimplementedError();
  }

}