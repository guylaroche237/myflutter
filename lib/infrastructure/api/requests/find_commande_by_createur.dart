import 'dart:convert';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/token.dart';

class FindCommandeByCreateur extends AbstractAuthenticatedRequest{
  final Token token;

  FindCommandeByCreateur(this.token):super(token);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/commandes/createur/"+token.id.toString();
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    return Commande.listFromJson(jsonDecode(response.httpResponse.body));
  }
}