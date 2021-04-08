class Fournisseur{
  String email;
  int id;
  String nom;
  String regime;
  String region;
  String telephone;
  String type;
  String ville;

  Fournisseur({
    this.email,this.id,this.nom,this.regime,this.region,this.telephone,this.type,this.ville
});

  Fournisseur.fromJson(Map<String, dynamic> json){
    email = json["email"];
    id = json["id"];
    nom = json["nom"];
    regime = json["regime"];
    region = json["region"];
    telephone = json["telephone"];
    type = json["type"];
    ville = json["ville"];

  }

  toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["id"] = this.id;
    data["nom"] = this.nom;
    data["regime"] = this.regime;
    data["region"] = this.region;
    data["telephone"] = this.telephone;
    data["type"] = this.type;
    data["ville"] = this.ville;
    return data;
  }

  static List<Fournisseur> listFromJson(List<dynamic> json) {
    return List<Fournisseur>.from(json.map((v) => Fournisseur.fromJson(v)));
  }

}