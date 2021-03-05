

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/commande_livrer_detail.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/stock_card.dart';
import 'package:myflutter/model/livraison.dart';
import 'package:myflutter/model/produit.dart';

class AllCommandeScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "all_cmd";
  const AllCommandeScreen({Key key}) : super(key: key);

  _StockScreenState createState() => _StockScreenState();

}

class _StockScreenState extends State<AllCommandeScreen>{
  Produit pro = Produit(fabriquant: "Guiness",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 550,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro1 = Produit(fabriquant: "Brasserie",nom: "33 export",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 700,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro2 = Produit(fabriquant: "Kadji",nom: "Kqdji Biere",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 246,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro3 = Produit(fabriquant: "Guiness",nom: "Malta Guinness",type: "jus",lot: "bouteille",quantite: 7,prixAchat1: 244,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro4 = Produit(fabriquant: "Brasserie",nom: "Castel",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 2444,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro5 = Produit(fabriquant: "UCB",nom: "Pamplemousse",type: "jus",lot: "bouteille",quantite: 100,prixAchat1: 2450,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 50,produitstatus: "NORMALE",siParisable: true,);
  Produit pro6 = Produit(fabriquant: "Kadji",nom: "Guinness Smoot",type: "biere",lot: "bouteille",quantite: 100,prixAchat1: 504,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 12,produitstatus: "NORMALE",siParisable: true,);
  Produit pro7 = Produit(fabriquant: "UCB",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 36,prixAchat1: 900,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 32,produitstatus: "NORMALE",siParisable: true,);
  Produit pro8 = Produit(fabriquant: "Guiness",nom: "grande guiness",type: "biere",lot: "bouteille",quantite: 31,prixAchat1: 400,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 6,produitstatus: "NORMALE",siParisable: true,);
  Livraison liv = Livraison(dateLivraison: "22-02-2021 at 16h",fournisseur: "Guinness",prixTotal: 1205000,quantiteProduit: 6);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:  SafeArea(
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
                      "Commandes",
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilterBox(
                    label: "Trier Commandes",
                    onTap: () {

                    },
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        StockCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },
                        ),
                        StockCard(produit: pro1,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro7,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro6,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro5,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro4,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro3,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro2,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        StockCard(produit: pro8,onPressed: (){
                          Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),


                      ],
                    ))
              ],
            ),
          ),
        )
    );
  }

}