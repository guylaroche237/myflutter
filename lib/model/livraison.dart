import 'package:myflutter/model/commande.dart';

class Livraison{
 String dateLivraison;
 int quantiteProduit;
 String fournisseur;
 Commande commande;
 String createur;
 String id;
 String numFacture;
 double prixTotal;


 Livraison({this.dateLivraison,this.fournisseur,this.prixTotal,this.quantiteProduit,this.commande,this.createur,this.id,this.numFacture});

 Livraison.fromJson(Map<String,dynamic> json){
   commande = Commande.fromJson(json["commande"]);
   createur = json["createur"];
   id = json["id"];
   numFacture = json["numFacture"];
   prixTotal = json["prixTotal"];
 }

 toJson() {
  // TODO: implement toJson
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data["prixTotal"] = this.prixTotal;
  data["numFacture"] = this.numFacture;
  data["id"] = this.id;
  data["createur"] = this.createur;
  data["commande"] = this.commande.toJson();
  return data;
 }

 static List<Livraison> listFromJson(List<dynamic> json) {
  return List<Livraison>.from(json.map((v) => Livraison.fromJson(v)));
 }
}