import 'dart:convert';

import 'package:myflutter/model/produit.dart';

class DetailsCommande{
   String datePeremption	;
   int id	;
   double prixTotalCmde	;
   double prixTotalLivre;
   int prixUnitaire	;
   Produit produit	;
   int qteCommandee;
   int qteLivree;

   DetailsCommande({this.datePeremption,this.id,this.prixTotalCmde,this.prixTotalLivre,this.prixUnitaire,this.produit,this.qteCommandee,this.qteLivree});

   DetailsCommande.fromJson(Map<String, dynamic> json){
     datePeremption = json["datePeremption"];
     id = json["id"];
     prixTotalCmde = json["prixTotalCmde"];
     prixTotalLivre = json["prixTotalLivre"];
     prixUnitaire = json["prixUnitaire"];
     produit = Produit.fromJson(json["produit"]);
     qteCommandee = json["qteCommandee"];
     qteLivree = json["qteLivree"];
   }

   toJson() {
     // TODO: implement toJson
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data["id"] = this.id;
     data["datePeremtion"] = this.datePeremption;
     data["prixTotalCmde"] = this.prixTotalCmde;
     data["prixTotalLivre"] = this.prixTotalLivre;
     data["prixUnitaire"] = this.prixUnitaire;
     data["produit"] = this.produit.toJson();
     data["qteCommandee"] = this.qteCommandee;
     data["qteLivree"] = this.qteLivree;

     return data;
   }

   secondtoJson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data["commande"] = this.id;
     data["datePeremtion"] = this.datePeremption;
     data["prixTotalCmde"] = this.prixTotalCmde;
     data["prixTotalLivre"] = this.prixTotalLivre;
     data["prixUnitaire"] = this.prixUnitaire;
     data["produit"] = this.produit.id;
     data["qteCommandee"] = this.qteCommandee;
     data["qteLivree"] = this.qteLivree;

     return data;



   }

   simpletoJson() {
     // TODO: implement toJson
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data["prixTotalCmde"] = this.prixTotalCmde;
     data["prixUnitaire"] = this.prixUnitaire;
     data["produit"] = this.produit.id.toString();
     data["qteCommandee"] = this.qteCommandee;
     return data;
   }



   static List<DetailsCommande> listFromJson(List<dynamic> json) {
     return List<DetailsCommande>.from(json.map((v) => DetailsCommande.fromJson(v)));
   }
}