import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/produit_stock.dart';
import 'package:myflutter/model/token.dart';
import 'package:myflutter/model/user.dart';

class FindStockByPointventeRequest extends AbstractAuthenticatedRequest{
  final Token token;
  final User user;

  FindStockByPointventeRequest(this.token,this.user) : super(token);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/stocks/pointvente/"+user.pointVente.id;
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    return ProduitStock.listFromJson(jsonDecode(response.httpResponse.body));
  }


}