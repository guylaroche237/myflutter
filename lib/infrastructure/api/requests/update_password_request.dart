import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/token.dart';

class UpdatePasswordRequest extends AbstractAuthenticatedRequest{
  final Token token;
  final String newPass;
  final String oldPass;

  UpdatePasswordRequest(this.token, this.newPass, this.oldPass):super(token);
  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/users/change";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "PUT";
  }

  @override
  getBody() {
    // TODO: implement getBody
    return {
      "newPswd": newPass,
      "oldPswd": oldPass,
      "username": token.username
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    throw UnimplementedError();
  }

}