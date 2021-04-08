import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/token.dart';
import 'package:myflutter/model/user.dart';

class FindUserByUsernameRequest extends AbstractAuthenticatedRequest{
  final Token token;

  FindUserByUsernameRequest(this.token) : super(token);
  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/users/username/"+token.username;
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    return User.fromJson(jsonDecode(response.httpResponse.body));
  }

}