import 'package:myflutter/model/inventaire.dart';
import 'package:myflutter/model/produit.dart';

class DetailsInventaire{
  int id;
  Inventaire inventaire;
  Produit produit;
  int stockInitial	;
  int  stockMarge	;
   int stockPerte	;
  int stockReel	;
  int stockTheorique;

  DetailsInventaire({this.id,this.inventaire,this.produit,this.stockInitial,this.stockMarge,this.stockPerte,this.stockReel,this.stockTheorique});

  DetailsInventaire.fromJson(Map<String,dynamic> json){
    id = json["id"];
    inventaire = Inventaire.fromJson(json["inventaire"]);
    produit = Produit.fromJson(json["produit"]);
    stockInitial = json["stockInitial"];
    stockMarge = json["stockMarge"];
    stockPerte = json["stockPerte"];
    stockReel = json["stockReel"];
    stockTheorique = json["stockTheorique"];

  }
}