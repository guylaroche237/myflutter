import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/token.dart';

class FindAllProduitRequest extends AbstractAuthenticatedRequest{
  final Token token;

  FindAllProduitRequest(this.token):super(token);

  @override
  String getUrl() {
    return "/api/produits";
  }

  @override
  String getVerb() {
   return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
   dynamic json = jsonDecode(response.httpResponse.body);
   print(json);
   List<Produit> produits = Produit.listFromJson(jsonDecode(response.httpResponse.body));
   return produits;

  }
}