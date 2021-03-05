import 'package:myflutter/model/produit_stock.dart';

class ProduitPerdu{
  String createur;
  String dateCreation;
  String datePerte;
  int id;
  int prixAchat;
  int prixTotal;
  ProduitStock produitStock;
  int quantite;
  String responsable;
  String typePerte;

  ProduitPerdu({
    this.createur,
    this.dateCreation,
    this.datePerte,
    this.id,
    this.prixAchat,
    this.prixTotal,
    this.produitStock,
    this.quantite,
    this.responsable,
    this.typePerte
});

  ProduitPerdu.fromJson(Map<String,dynamic> json){
    createur = json["createur"];
    dateCreation = json["dateCreation"];
    datePerte = json["datePerte"];
    id = json["id"];
    prixAchat = json["prixAchat"];
    prixTotal = json["prixTotal"];
    produitStock = json["produitStock"];
    quantite = json["quantite"];
    responsable = json["responsable"];
    typePerte = json["typePerte"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["createur"] = this.createur;
    data["dateCreation"] = this.dateCreation;
    data["id"] = this.id;
    data["datePerte"] = this.datePerte;
    data["prixAchat"] = this.prixAchat;
    data["prixTotal"] = this.prixTotal;

    data["produitStock"] = this.produitStock;
    data["quantite"] = this.quantite;
    data["responsable"] = this.responsable;
    data["typePerte"] = this.typePerte;
    return data;
  }

}