import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/fournisseur.dart';
import 'package:myflutter/model/token.dart';

class FindAllFournisseursRequest extends AbstractAuthenticatedRequest{
  final Token token;

  FindAllFournisseursRequest(this.token):super(token);


  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/fournisseurs";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    if(response.httpResponse.statusCode == 200){
      List<Fournisseur> fournisseurs = Fournisseur.listFromJson(jsonDecode(response.httpResponse.body));
      return fournisseurs;
    }else{
      return null;
    }
  }

}