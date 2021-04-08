import 'package:flutter/material.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/find_all_produit_request.dart';
import 'package:myflutter/infrastructure/api/requests/find_stock_by_pointvente_request.dart';
import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/produit_stock.dart';
import 'package:myflutter/model/token.dart';

class ProduitProvider with ChangeNotifier{

  Future<List<Produit>> getAllProduits(Token token) async {
    FindAllProduitRequest findAllProduitRequest = FindAllProduitRequest(token);
    List<Produit> produits = findAllProduitRequest.parseResult( await ApiClient.execOrFail(findAllProduitRequest)) ;
    return produits;
  }

  Future<List<ProduitStock>> getAllStock(AuthProvider authProvider) async {
    FindStockByPointventeRequest findStockByPointventeRequest = FindStockByPointventeRequest(authProvider.token,authProvider.user);
    List<ProduitStock> list = findStockByPointventeRequest.parseResult(await ApiClient.execOrFail(findStockByPointventeRequest));
    return list;
  }


}