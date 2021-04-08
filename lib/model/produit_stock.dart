import 'package:myflutter/model/detailsInventaire.dart';
import 'package:myflutter/model/point_vente.dart';
import 'package:myflutter/model/produit.dart';

class ProduitStock{
  String dateCreation;
  String dateMAJ;
  DetailsInventaire detailsInventaire;
  int id;
  String modificateur;
  PointVente pointVente;
  int prixVente	;
  int  stockInitial	;
  int stockMarge	;
  int stockPerte;
  int stockReel	;
  int stockTheorique;


  ProduitStock({
    this.dateMAJ,
    this.id,
    this.modificateur,
    this.pointVente,
    this.stockInitial,
    this.stockMarge,
    this.stockPerte,
    this.stockReel,
    this.stockTheorique

});

  ProduitStock.fromJson(Map<String,dynamic> json){
    dateMAJ = json["dateMAJ"];
    id = json["id"];
    modificateur = json["modificateur"];
    pointVente = json["pointVente"];
    stockInitial = json["stockInitial"];
    stockMarge = json["stockMarge"];
    stockPerte = json["stockPerte"];
    stockReel = json["stockReel"];
    stockTheorique = json["stockTheorique"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["dateMAJ"] = this.dateMAJ;
    data["modificateur"] = this.modificateur;
    data["id"] = this.id;
    data["pointVente"] = this.pointVente;

    return data;
  }

  static List<ProduitStock> listFromJson(List<dynamic> json) {
    return List<ProduitStock>.from(json.map((v) => ProduitStock.fromJson(v)));
  }
}