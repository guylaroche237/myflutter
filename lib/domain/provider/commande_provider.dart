import 'package:flutter/cupertino.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/create_commande_request.dart';
import 'package:myflutter/infrastructure/api/requests/create_livraison_request.dart';
import 'package:myflutter/infrastructure/api/requests/find_all_fournisseurs_request.dart';
import 'package:myflutter/infrastructure/api/requests/find_commande_by_createur.dart';
import 'package:myflutter/infrastructure/api/requests/find_livraison_by_createur_request.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/fournisseur.dart';
import 'package:myflutter/model/livraison.dart';
import 'package:myflutter/model/token.dart';

class CommandeProvider with ChangeNotifier{

 Future<List<Commande>> findCommandeByCreateur(Token token) async {
   FindCommandeByCreateur findCommandeByCreateur = FindCommandeByCreateur(token);
   List<Commande> commandes = findCommandeByCreateur.parseResult(await ApiClient.execOrFail(findCommandeByCreateur));
   print("---------------- Commandes Length ---------------------");
   print(commandes);
   return commandes;
 }

 Future<int> saveCommande(AuthProvider authProvider,Commande commande) async {
   CreateCommandeRequest createCommandeRequest = CreateCommandeRequest(authProvider,commande);
   int statut = await createCommandeRequest.parseResult(await ApiClient.execOrFail(createCommandeRequest));
   return statut;
 }

 Future<List<Fournisseur>> allFournisseurs(Token token) async {
   FindAllFournisseursRequest fournisseur = FindAllFournisseursRequest(token);
   List<Fournisseur> list = await fournisseur.parseResult(await ApiClient.execOrFail(fournisseur));
   return list;
 }

 Future<List<Livraison>> findAllLivraisonByCreateur(Token token) async {
   FindLivraisonByCreateurRequest findLivraisonByCreateurRequest = FindLivraisonByCreateurRequest(token);
   List<Livraison> list = await findLivraisonByCreateurRequest.parseResult(await ApiClient.execOrFail(findLivraisonByCreateurRequest));
   return list;

 }

 Future<Livraison> saveLivraison(Livraison livraison,Token token) async {
   CreateLivraisonRequest createLivraisonRequest = CreateLivraisonRequest(livraison,token);
   Future<Livraison> liv = createLivraisonRequest.parseResult(await ApiClient.execOrFail(createLivraisonRequest));
 }





}