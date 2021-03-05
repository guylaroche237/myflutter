import 'package:myflutter/model/point_vente.dart';

class Vente{
  String createur;
  String dateCreation;
  String id;
  PointVente pointVente;
  String dateVente;
  int prixTotal;
  int quantite;
  int quantiteProduit;
  String fournisseur;

  Vente({
    this.createur,
    this.dateCreation,
    this.id,
    this.pointVente,
    this.prixTotal,
    this.quantite,
    this.dateVente,
    this.fournisseur,this.quantiteProduit
  });

  Vente.fromJson(Map<String,dynamic> json){
    createur = json["createur"];
    dateCreation = json["dateCreation"];
    id = json["id"];
    pointVente = json["pointVente"];
    prixTotal = json["prixTotal"];
    quantite = json["quantite"];
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
}