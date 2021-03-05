
enum TypeRegime{
  SIMPLIFIE,
  AUTONOME,
  SARL,
  STANDARD
}

enum Categorie{
  SNACK,
  BAR,
  DEPOT,
  BOITE_NUIT
}
class PointVente{
  String categorie;
  String dateCreation;
  String id;
  String nomCommercial;
  String nomPointVente;
  String quartier;
  String region;
  String typeRegime;
  String ville;

  PointVente({
    this.categorie,
    this.dateCreation,
    this.id,
    this.nomCommercial,
    this.nomPointVente,
    this.quartier,
    this.region,
    this.typeRegime,
    this.ville
});

PointVente.fromJson(Map<String, dynamic> json){
  categorie = json["categorie"];
  dateCreation = json["dateCreation"];
  id = json["id"];
  nomCommercial = json["nomCommercial"];
  nomPointVente = json["nomPointVente"];
  quartier = json["quartier"];
  region = json["region"];
  typeRegime = json["typeRegime"];
  ville = json["ville"];
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["categorie"] = this.categorie;
    data["dateCreation"] = this.dateCreation;
    data["id"] = this.id;
    data["nomCommercial"] = this.nomCommercial;
    data["nomPointVente"] = this.nomPointVente;
    data["quartier"] = this.quartier;
    data["region"] = this.region;
    data["typeRegime"] = this.typeRegime;
    data["ville"] = this.ville;

    return data;
  }




}