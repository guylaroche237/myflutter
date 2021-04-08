import 'dart:convert';

import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/livraison.dart';
import 'package:myflutter/model/token.dart';

class CreateLivraisonRequest extends AbstractAuthenticatedRequest{
  final Livraison livraison;
  final Token token;

  CreateLivraisonRequest(this.livraison, this.token):super(token);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/livraisons";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "POST";
  }
/**
  @override
  getBody() {
    // TODO: implement getBody
    return {
      "commande":livraison.commande.toJson(),
      "createur": token.id.toString(),
      "id": "",
      "numFacture": livraison.numFacture,
      "prixTotal": livraison.prixTotal
    };

  }
    **/

  @override
  getBody() {
    // TODO: implement getBody
    return {
      "commande": livraison.commande.id.toString(),
      "createur": token.id.toString(),
      "detailsLivraison": livraison.commande.secondelistDetailCmdToJson(livraison.commande.detailsCommande),
      "fournisseur": livraison.commande.fournisseur.id,
      "numFacture": livraison.numFacture,
      "pointVente": livraison.commande.pointVente.id.toString(),
      "prixTotal": livraison.prixTotal
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    print("---------------------- TOUT EST BON ----------------------------------");
    print(response.httpResponse.statusCode);
    return Livraison.fromJson(jsonDecode(response.httpResponse.body));

  }

}