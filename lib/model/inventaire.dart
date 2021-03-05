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

  Inventaire({this.numero,this.produitName,this.qte,this.idPointVente,this.stockinitial,this.stockMarge,this.stockPerte,this.stockreel,this.stocktheorique,this.dateTime,this.createurName,this.images});
}