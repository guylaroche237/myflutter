import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/vente.dart';

class ProduitVendu{
  int id;
  int prixTotal;
  int prixUnitaire;
  Produit produit;
  int quantite;


  ProduitVendu({
    this.id,
    this.prixTotal,
    this.prixUnitaire,
    this.quantite,
    this.produit
});

  ProduitVendu.fromJson(Map<String,dynamic> json){
    id = json["id"];
    prixTotal = json["prixTotal"];
    prixUnitaire = json["prixUnitaire"];
    quantite = json["quantite"];
    produit = Produit.fromJson(json["produit"]);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["prixTotal"] = this.prixTotal;
    data["prixUnitaire"] = this.prixUnitaire;
    data["id"] = this.id;
    data["produit"] = this.produit.toJson();
    data["quantite"] = this.quantite;
  }

  static List<ProduitVendu> listFromJson(List<dynamic> json) {
    return List<ProduitVendu>.from(json.map((v) => ProduitVendu.fromJson(v)));
  }


}