import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/stock/trier_stock_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/provider/produit_provider.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/produit_card.dart';
import 'package:myflutter/domain/widget/layout/stock_card.dart';
import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/produit_stock.dart';
import 'package:provider/provider.dart';

import 'detail_stock_screen.dart';
import 'stock_detail_args.dart';


class StockScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "routes_stock";
  const StockScreen({Key key}) : super(key: key);

  _StockScreenState createState() => _StockScreenState();

}

class _StockScreenState extends State<StockScreen>{
  List<ProduitStock> list = [];
  bool inAsyncroll = false;
  Produit pro = Produit(fabriquant: "Guiness",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 550,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro1 = Produit(fabriquant: "Brasserie",nom: "33 export",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 700,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro2 = Produit(fabriquant: "Kadji",nom: "Kqdji Biere",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 246,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro3 = Produit(fabriquant: "Guiness",nom: "Malta Guinness",type: "jus",lot: "bouteille",quantite: 7,prixAchat1: 244,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro4 = Produit(fabriquant: "Brasserie",nom: "Castel",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 2444,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro5 = Produit(fabriquant: "UCB",nom: "Pamplemousse",type: "jus",lot: "bouteille",quantite: 100,prixAchat1: 2450,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 50,produitstatus: "NORMALE",siParisable: true,);
  Produit pro6 = Produit(fabriquant: "Kadji",nom: "Guinness Smoot",type: "biere",lot: "bouteille",quantite: 100,prixAchat1: 504,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 12,produitstatus: "NORMALE",siParisable: true,);
  Produit pro7 = Produit(fabriquant: "UCB",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 36,prixAchat1: 900,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 32,produitstatus: "NORMALE",siParisable: true,);
  Produit pro8 = Produit(fabriquant: "Guiness",nom: "grande guiness",type: "biere",lot: "bouteille",quantite: 31,prixAchat1: 400,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 6,produitstatus: "NORMALE",siParisable: true,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(context,listen: false);
    getProduitStock(produitProvider, authProvider);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: inAsyncroll,
          child: Container(
            height: MediaQuery.of(context).size.height - 32 - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stock Dispo",
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilterBox(
                    label: "Trier Stock",
                    onTap: () {
                      Navigator.pushNamed(context,TrierStockScreen.ROUTE);

                    },
                  ),
                ),
                (list.length != 0)? Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context,index){
                            ProduitStock produitStock = list[index];
                            return StockCard(produit: pro8,);
                          }),
                    )):Expanded(child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notification_important,color: Colors.red,size: 25,),
                      Text("Pas de Stock Disponible",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      )
    );
  }

  getProduitStock(ProduitProvider produitProvider,AuthProvider authProvider) async {
    setState(() {
      inAsyncroll = true;
    });
    List<ProduitStock> stock = await produitProvider.getAllStock(authProvider);


    setState(() {
      list = stock;
      inAsyncroll = false;
    });

  }

}