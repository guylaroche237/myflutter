import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/model/token.dart';

class LoginRequest extends AbstractApiRequest{
  final String phone;
  final String password;

  LoginRequest(this.phone, this.password);

  @override
  String getUrl() {
   return "/api/users/login";
  }

  @override
  String getVerb() {
    return "POST";
  }

  @override
  getBody() {
    // TODO: implement getBody
    return {
      "username":phone,
      "password":password
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    print(response.httpResponse.statusCode);
    if(response.httpResponse.statusCode == 200){
      return Token.fromJson(jsonDecode(response.httpResponse.body));

    }else{
      return null;
    }

  }

}