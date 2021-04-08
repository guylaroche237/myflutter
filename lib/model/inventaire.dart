import 'package:myflutter/model/point_vente.dart';

class Inventaire{
  String numero ;
  String idPointVente;
  int stockinitial;
  int stocktheorique;
  int stockreel;
  int stockPerte;
  int stockMarge;
  DateTime dateTime;
  String createurName;
  String produitName;
  int qte;
  String images;

  String createur;
  String dateCreation;
  String id;
  PointVente pointVente;

  Inventaire({this.numero,this.produitName,this.qte,this.idPointVente,this.stockinitial,
    this.stockMarge,this.stockPerte,this.stockreel,this.stocktheorique,this.dateTime,this.createurName,this.images,
    this.createur,
    this.dateCreation,
    this.id,
    this.pointVente
  });
  Inventaire.fromJson(Map<String,dynamic> json){
    createur = json["createur"];
    dateCreation = json["dateCreation"];
    id = json["id"];
    pointVente = json["pointVente"];
  }
}