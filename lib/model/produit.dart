
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum ProduitStatus{
  DANGER,
  NORMAL,
  PASSABLE,
  PARFAIT
}

class Produit{
 int id;
 String nom;
 String type;
 String lot;
 String unite;
 int quantite;
 int prixAchat1;
 int prixAchat2;
 int prixAchat3;
 int prixAchat4;
 int prixVente;
 int quantiteAlerte;
 int quantiteAlertStock;
 bool siParisable;
 bool siPerissable;
 String fabriquant;
 String produitstatus;

 Produit({
   this.id,
   this.nom,
   this.type,
   this.lot,
   this.unite,
   this.quantite,
   this.prixAchat1,
   this.prixAchat2,
   this.prixAchat3,
   this.prixAchat4,
   this.prixVente,
   this.quantiteAlerte,
   this.produitstatus = '',
   this.quantiteAlertStock,
   this.siParisable,
   this.fabriquant,
   this.siPerissable});

 Produit.fromJson(Map<String,dynamic> json){
   id = json["id"];
   nom = json["nom"];
   type = json["type"];
   lot = json["lot"];
   unite = json["unite"];
   quantite = json["quantite"];
   prixAchat1 = json["prixAchat1"];
   prixAchat2 = json["prixAchat2"];
   prixAchat3 = json["prixAchat3"];
   prixAchat4 = json["prixAchat4"];
   prixVente = json["prixVente"];
   quantiteAlertStock = json["quantiteAlertStock"];
   fabriquant = json["fabriquant"];
   siPerissable = json["siPerissable"];

 }

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data["id"] = this.id;
   data["nom"] = this.nom;
   data["type"] = this.type;
   data["lot"] = this.lot;
   data["unite"] = this.unite;
   data["quantite"] = this.quantite;
   data["prixAchat1"] = this.prixAchat1;
   data["prixAchat2"] = this.prixAchat2;
   data["prixAchat3"] = this.prixAchat3;
   data["prixAchat4"] = this.prixAchat4;
   data["prixVente"] = this.prixVente;
   data["quantiteAlertStock"] = this.quantiteAlertStock;
   data["fabriquant"] = this.fabriquant;
   data["siPerissable"] = this.siPerissable;

   return data;
 }

 String get statusMessage {
   if(this.quantite<= this.quantiteAlerte){
     this.produitstatus = "DANGER";
     return "DANGER";
   }else if(20 > this.quantite  - this.quantiteAlerte){
     this.produitstatus = "PASSABLE";
     return "PASSABLE";
   }else if(this.quantite >40 && this.quantite <= 60){
     return "NORMAL";
   }else if(60 > this.quantite - this.quantiteAlerte){
     return "PARFAIT";
   }
 }

 ProduitStatus get status => EnumToString.fromString(ProduitStatus.values, this.produitstatus);

 Color get statusToColor {
     String message = this.statusMessage;
   switch (message) {
     case "NORMAL":
       return Colors.blue;
     case "PASSABLE":
       return Colors.green;
     case "DANGER":
       return Colors.red;
     case "PARFAIT":
       return Colors.orange;
       break;
     default:
       return Colors.grey;
   }
 }

}