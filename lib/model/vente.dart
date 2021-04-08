import 'package:myflutter/model/point_vente.dart';
import 'package:myflutter/model/produit_vendu.dart';

class Vente{
  String createur;
  String dateCreation;
  String id;
  List<ProduitVendu> listproduitVendu;
  PointVente pointVente;
  int prixTotal;
  int quantite;

  Vente({
    this.createur,
    this.dateCreation,
    this.id,
    this.pointVente,
    this.prixTotal,
    this.quantite,
    this.listproduitVendu

  });

  Vente.fromJson(Map<String,dynamic> json){
    createur = json["createur"];
    dateCreation = json["dateCreation"];
    id = json["id"];
    pointVente = json["pointVente"];
    prixTotal = json["prixTotal"];
    quantite = json["quantite"];
    listproduitVendu = ProduitVendu.listFromJson(json["listproduitVendu"]);
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["createur"] = this.createur;
    data["dateCreation"] = this.dateCreation;
    data["id"] = this.id;
    data["pointVente"] = this.pointVente;
    data["prixTotal"] = this.prixTotal;
    data["quantite"] = this.quantite;
  }

  static List<Vente> listFromJson(List<dynamic> json) {
    return List<Vente>.from(json.map((v) => Vente.fromJson(v)));
  }


}