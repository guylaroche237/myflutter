
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_args.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_detail.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/trier_livraison_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/livraison_card.dart';
import 'package:myflutter/model/livraison.dart';

class LivraisonScreen extends StatefulWidget{
  static const ROUTE = "livraison/";
  const LivraisonScreen({Key key,}) : super(key: key);

  _CommandeScreenState createState() => _CommandeScreenState();

}

class _CommandeScreenState extends State<LivraisonScreen>{
  Livraison liv = Livraison(dateLivraison: "22-02-2021 at 16h",fournisseur: "Guinness",prixTotal: 1205000,quantiteProduit: 6);
  Livraison liv1 = Livraison(dateLivraison: "22-02-2021 at 16h",fournisseur: "Kadji",prixTotal: 188000,quantiteProduit: 2);
  Livraison liv2 = Livraison(dateLivraison: "2-05-2021 at 16h",fournisseur: "Brasserie",prixTotal: 175000,quantiteProduit: 5);
  Livraison liv3 = Livraison(dateLivraison: "22-03-2021 at 16h",fournisseur: "UCB",prixTotal: 125000,quantiteProduit: 6);
  Livraison liv4 = Livraison(dateLivraison: "22-02-2021 at 16h",fournisseur: "Guinness",prixTotal: 12000,quantiteProduit: 5);
  Livraison liv5 = Livraison(dateLivraison: "14-01-2021 at 16h",fournisseur: "Guinness",prixTotal: 125000,quantiteProduit: 7);
  Livraison liv6 = Livraison(dateLivraison: "2-02-2020 at 16h",fournisseur: "Brasserie",prixTotal: 129000,quantiteProduit: 9);
  Livraison liv7 = Livraison(dateLivraison: "7-02-2020 at 16h",fournisseur: "Guinness",prixTotal: 625000,quantiteProduit: 12);
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
                      "Livraisons",
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),


                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilterBox(
                    label: "Trier Livraison",
                    onTap: () {
                      Navigator.pushNamed(context, TrierLivraisonScreen.ROUTE);
                    },
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        LivraisonCard(livraison: liv,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv1,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv2,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv3,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv4,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv5,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv6,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv7,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                        },),
                        LivraisonCard(livraison: liv,onPressed: (){
                          Navigator.pushNamed(context, DetailsLivraisonScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
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