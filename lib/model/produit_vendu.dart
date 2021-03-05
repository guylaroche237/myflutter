import 'package:myflutter/model/vente.dart';

class ProduitVendu{
  int id;
  int prixTotal;
  int prixUnitaire;
  int quantite;
  Vente vente;

  ProduitVendu({
    this.id,
    this.prixTotal,
    this.prixUnitaire,
    this.quantite,
    this.vente
});

  ProduitVendu.fromJson(Map<String,dynamic> json){
    id = json["id"];
    prixTotal = json["prixTotal"];
    prixUnitaire = json["prixUnitaire"];
    quantite = json["quantite"];
    vente = json["vente"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["prixTotal"] = this.prixTotal;
    data["prixUnitaire"] = this.prixUnitaire;
    data["id"] = this.id;
    data["vente"] = this.vente;
    data["quantite"] = this.quantite;
  }


}