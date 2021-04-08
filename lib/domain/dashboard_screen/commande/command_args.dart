import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/token.dart';

class CommandeArgs{
  List<Commande> commandes;
  AuthProvider authProvider;
  int qte;
  String nomProduit;
  int qtec;
  double prixUnitaire;
  int qteLivrer;
  CommandeArgs({this.qte, this.nomProduit,this.prixUnitaire,this.qteLivrer=0,this.qtec,this.commandes,this.authProvider});
}