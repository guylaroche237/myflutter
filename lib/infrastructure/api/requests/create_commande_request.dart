import 'dart:convert';

import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/details_commande.dart';
import 'package:myflutter/model/fournisseur.dart';
import 'package:myflutter/model/point_vente.dart';
import 'package:myflutter/model/token.dart';

class CreateCommandeRequest extends AbstractAuthenticatedRequest{
  final AuthProvider authProvider;
  final Commande commande;

  CreateCommandeRequest(this.authProvider,this.commande):super(authProvider.token);

  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/commandes";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "POST";
  }

 /** @override
  getBody() {
    // TODO: implement getBody
    return {
      "createur": authProvider.token.id.toString(),
      "detailsCommande": commande.listDetailCmdToJson(commande.detailsCommande),
      "fournisseur": commande.fournisseur.toJson(),
      "id": "",
      "libelle": commande.libelle,
      "pointVente": authProvider.user.pointVente.toJson(),
      "prixTotal": commande.prixTotal
    };
  }**/

  @override
  getBody() {
    // TODO: implement getBody
    return {
      "createur": authProvider.token.id.toString(),
      "detailsCommande": commande.simplelistDetailCmdToJson(commande.detailsCommande),
      "fournisseur": commande.fournisseur.id.toString(),
      "libelle": commande.libelle,
      "pointVente": commande.pointVente.id,
      "prixTotal": commande.prixTotal
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    if(response.httpResponse.statusCode == 200){
      print("----------- requete ok -------------");
      return 200;
     // return Commande.fromJson(jsonDecode(response.httpResponse.body));
    }else{
      return response.httpResponse.statusCode;
    }
  }

}