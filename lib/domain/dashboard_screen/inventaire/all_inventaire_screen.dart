

import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/inventaire/detail_inventaire_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/inventaire_card.dart';
import 'package:myflutter/domain/widget/layout/stock_card.dart';
import 'package:myflutter/model/inventaire.dart';
import 'package:myflutter/model/produit.dart';

class AllInventaireScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "all_inv";
  const AllInventaireScreen({Key key}) : super(key: key);

  _StockScreenState createState() => _StockScreenState();

}

class _StockScreenState extends State<AllInventaireScreen>{
  Produit pro = Produit(fabriquant: "Guiness",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 550,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro1 = Produit(fabriquant: "Brasserie",nom: "33 export",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 700,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro2 = Produit(fabriquant: "Kadji",nom: "Kqdji Biere",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 246,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro3 = Produit(fabriquant: "Guiness",nom: "Malta Guinness",type: "jus",lot: "bouteille",quantite: 7,prixAchat1: 244,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro4 = Produit(fabriquant: "Brasserie",nom: "Castel",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 2444,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro5 = Produit(fabriquant: "UCB",nom: "Pamplemousse",type: "jus",lot: "bouteille",quantite: 100,prixAchat1: 2450,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 50,produitstatus: "NORMALE",siParisable: true,);
  Produit pro6 = Produit(fabriquant: "Kadji",nom: "Guinness Smoot",type: "biere",lot: "bouteille",quantite: 100,prixAchat1: 504,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 12,produitstatus: "NORMALE",siParisable: true,);
  Produit pro7 = Produit(fabriquant: "UCB",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 36,prixAchat1: 900,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 32,produitstatus: "NORMALE",siParisable: true,);
  Produit pro8 = Produit(fabriquant: "Guiness",nom: "grande guiness",type: "biere",lot: "bouteille",quantite: 31,prixAchat1: 400,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 6,produitstatus: "NORMALE",siParisable: true,);

  Inventaire inventaire = Inventaire(createurName: "Franki Dolar",produitName:"Guinness",qte:24,dateTime: DateTime.now(),idPointVente: "2",numero: "56",stockinitial: 34,stockMarge: 3,stockPerte: 76,stockreel: 56,stocktheorique: 6,images: "assets/images/planet.jpg");
  Inventaire inventaire1 = Inventaire(createurName: "Bakam Junior",produitName:"Grenadine",qte:2,dateTime: DateTime.now(),idPointVente: "12",numero: "6",stockinitial: 34,stockMarge: 3,stockPerte: 6,stockreel: 56,stocktheorique: 26,images: "assets/images/acceuil.jpg");
  Inventaire inventaire2 = Inventaire(createurName: "Franki Dolar",produitName:"Orange",qte:21,dateTime: DateTime.now(),idPointVente: "32",numero: "56",stockinitial: 34,stockMarge: 3,stockPerte: 76,stockreel: 56,stocktheorique: 6,images: "assets/images/vb.jpg");
  Inventaire inventaire3 = Inventaire(createurName: "Moustaffar khedal",produitName:"Solda",qte:31,dateTime: DateTime.now(),idPointVente: "2",numero: "61",stockinitial: 34,stockMarge: 3,stockPerte: 6,stockreel: 56,stocktheorique: 26,images: "assets/images/malta.png");
  Inventaire inventaire4 = Inventaire(createurName: "Franki Dolar",produitName:"Guinness smoot",qte:23,dateTime: DateTime.now(),idPointVente: "28",numero: "56",stockinitial: 34,stockMarge: 3,stockPerte: 76,stockreel: 56,stocktheorique: 6,images: "assets/images/gui.jpeg");
  Inventaire inventaire5 = Inventaire(createurName: "Florent Ikebe",produitName:"Orangina",qte:5,dateTime: DateTime.now(),idPointVente: "2",numero: "6",stockinitial: 34,stockMarge: 3,stockPerte: 6,stockreel: 56,stocktheorique: 26,images: "assets/images/ucb.jpg");

  Inventaire inventaire6 = Inventaire(createurName: "Jeane flore",produitName:"MALTA",qte:4,dateTime: DateTime.now(),idPointVente: "12",numero: "56",stockinitial: 34,stockMarge: 33,stockPerte: 76,stockreel: 56,stocktheorique: 76,images: "assets/images/kadji.png");
  Inventaire inventaire7 = Inventaire(createurName: "Franki Dollar",produitName:"cASTEL",qte:9,dateTime: DateTime.now(),idPointVente: "22",numero: "6",stockinitial: 34,stockMarge: 3,stockPerte: 6,stockreel: 56,stocktheorique: 6,images: "assets/images/acceuil.jpg");

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
                      "Inventaires",
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilterBox(
                    label: "Inventaires Anciens",
                    onTap: () {

                    },
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire1);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire2);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire3);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire4);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire5);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire6);
                        },),
                        InventaireCard(produit: pro,onPressed: (){
                          Navigator.pushNamed(context,DetailInventaireScreen.ROUTE,arguments: inventaire7);
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