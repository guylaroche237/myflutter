import 'package:myflutter/main.dart';
import 'package:myflutter/model/details_commande.dart';
import 'package:myflutter/model/fournisseur.dart';
import 'package:myflutter/model/point_vente.dart';

class Commande{
  String createur;
  List<DetailsCommande> detailsCommande;
  Fournisseur fournisseur;
  String id;
  String libelle;
  PointVente pointVente;
  double prixTotal;

  Commande({this.createur,this.detailsCommande,this.fournisseur,this.id,this.libelle,this.pointVente,this.prixTotal});

  Commande.fromJson(Map<String,dynamic> json){
    createur = json["createur"];
    id = json["id"];
    libelle = json["libelle"];
    prixTotal = json["prixTotal"];
    pointVente = PointVente.fromJson(json["pointVente"]);
   detailsCommande = listDetailCmdfromJson(json["detailsCommande"]);
   print(json["fournisseur"]);
   fournisseur = Fournisseur.fromJson(json["fournisseur"]);

  }

  toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["createur"] = this.createur;
   data["detailsCommande"] = listDetailCmdToJson(this.detailsCommande);
    data["fournisseur"] = this.fournisseur.toJson();
    data["id"] = this.id;
    data["libelle"] = this.libelle;
    data["pointVente"] = this.pointVente.toJson();
    data["prixTotal"] = this.prixTotal;
    return data;
  }

  static List<Commande> listFromJson(List<dynamic> json) {
    return List<Commande>.from(json.map((v) => Commande.fromJson(v)));
  }

  listDetailCmdToJson(List<DetailsCommande> json) {
    List<Map<String,dynamic>> listJson = [];
    json.forEach((element) {
      listJson.add(element.toJson());
    });
    return listJson;
  }

  simplelistDetailCmdToJson(List<DetailsCommande> json) {
    List<Map<String,dynamic>> listJson = [];
    json.forEach((element) {
      listJson.add(element.simpletoJson());
    });
    return listJson;
  }

  secondelistDetailCmdToJson(List<DetailsCommande> json) {
    List<Map<String,dynamic>> listJson = [];
    json.forEach((element) {
      listJson.add(element.secondtoJson());
    });
    return listJson;
  }


  listDetailCmdfromJson(List<dynamic> listJon){
    List<DetailsCommande> listDcmd = [];
    listJon.forEach((element) {
      print(element);
      listDcmd.add(DetailsCommande.fromJson(element));
    });
    return listDcmd;

  }
}