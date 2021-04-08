import 'package:myflutter/infrastructure/persistence/json_persistable.dart';
import 'package:myflutter/model/point_vente.dart';

class User extends JsonPersistable{
  static const PERSISTABLE_KEY = "USER_ON_LINE";
   int id;
   String nom;
   String prenom;
   String username;
   String email;
   String telephone;
   PointVente pointVente;
   String dateCreation;
   String createur;

  User({this.id, this.nom, this.prenom, this.username, this.email, this.telephone,this.pointVente,this.createur,this.dateCreation});

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    nom = json["nom"];
    prenom = json["prenom"];
    username = json["username"];
    email = json["email"];
    telephone = json["telephone"];
    Map<String,dynamic> pv = json["pointVente"];
    pointVente = PointVente.fromJson(json["pointVente"]);
    dateCreation = json["dateCreation"];
    createur = json["createur"];

  }

  @override
  JsonPersistable fromJson(json) {
    // TODO: implement fromJson
    return User.fromJson(json);

  }

  @override
  String getPersistableKey() {
    // TODO: implement getPersistableKey
    return User.PERSISTABLE_KEY;
  }

  @override
  toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["username"] = this.username;

    return data;
  }

}