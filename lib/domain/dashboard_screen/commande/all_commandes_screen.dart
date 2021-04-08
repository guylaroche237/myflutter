

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/commande/commande_livrer_detail.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/provider/commande_provider.dart';
import 'package:myflutter/domain/widget/layout/commande_layout_card.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/stock_card.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/livraison.dart';
import 'package:myflutter/model/produit.dart';
import 'package:provider/provider.dart';

import 'command_args.dart';

class AllCommandeScreen extends StatefulWidget{
  //final GlobalKey<NavigatorState> navigatorKey;
  static const ROUTE = "all_cmd";
  const AllCommandeScreen({Key key,}) : super(key: key);

  _StockScreenState createState() => _StockScreenState();

}

class _StockScreenState extends State<AllCommandeScreen>{
  bool inAsyncroll = false;
  List<Commande> listCommande = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
    CommandeProvider commandeProvider = Provider.of<CommandeProvider>(context,listen: false);
    findAllCommande(commandeProvider, authProvider);
    print(authProvider.token.id);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ModalProgressHUD(
      inAsyncCall: inAsyncroll,
      child: Scaffold(
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
                  (listCommande.length != 0)? Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: listCommande.length,
                            itemBuilder: (context,index){
                              Livraison liv = Livraison(dateLivraison: "22-02-2021 at 16h",fournisseur: "Guinness",prixTotal: 1205000,quantiteProduit: 6,commande: listCommande[index]);
                              return CommandLayoutCard(commande: listCommande[index],onPressed: (){
                                Navigator.pushNamed(context, CommandeLivrerDetailScreen.ROUTE,arguments: LivraisonArgs(livraison: liv));
                              },);
                            }),
                      )):Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notification_important,color: Colors.red,size: 25,),
                        Text("Pas de Commande trouves",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
      ),
    );
  }

  findAllCommande(CommandeProvider commandeProvider,AuthProvider authProvider) async {
    setState(() {
      inAsyncroll = true;
    });
    List<Commande> cmds =  await commandeProvider.findCommandeByCreateur(authProvider.token);


    setState(() {
      inAsyncroll = false;
      listCommande = cmds;
    });

  }

}