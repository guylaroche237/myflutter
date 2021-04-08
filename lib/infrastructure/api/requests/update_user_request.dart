import 'dart:convert';

import 'package:myflutter/domain/dashboard_screen/profile/update_args.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/token.dart';
import 'package:myflutter/model/user.dart';

class UpdateUserRequest extends AbstractAuthenticatedRequest{
  final Token token;
  final User user;
  final UpdateAgrs agrs;

  UpdateUserRequest({this.token, this.user,this.agrs}) : super(token);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/users/update";
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
      "email": this.agrs.email??token.email,
      "nom": this.agrs.nom??user.nom,
      "prenom": this.agrs.prenom??user.prenom,
      "role": token.role,
      "telephone": user.telephone,
      "username": token.username
    };
  }


  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
   // return User.fromJson(jsonDecode(response.httpResponse.body));
   // print(" --------------- user ---------------------");
    //print(response.httpResponse.body);
  //  return response.httpResponse.body;
  }
}