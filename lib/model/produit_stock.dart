import 'package:myflutter/model/point_vente.dart';
import 'package:myflutter/model/produit.dart';

class ProduitStock{
  String dateMAJ;
  int id;
  String modificateur;
  PointVente pointVente;
  Produit produit;
  int quantite;

  ProduitStock({
    this.dateMAJ,
    this.id,
    this.modificateur,
    this.pointVente,
    this.produit,
    this.quantite
});

  ProduitStock.fromJson(Map<String,dynamic> json){
    dateMAJ = json["dateMAJ"];
    id = json["id"];
    modificateur = json["modificateur"];
    pointVente = json["pointVente"];
    produit = json["produit"];
    quantite = json["quantite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["dateMAJ"] = this.dateMAJ;
    data["modificateur"] = this.modificateur;
    data["id"] = this.id;
    data["pointVente"] = this.pointVente;
    data["produit"] = this.produit;
    data["quantite"] = this.quantite;
    return data;
  }
}