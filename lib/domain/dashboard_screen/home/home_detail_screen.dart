

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/benefices/benefice_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/add_commande_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/all_commandes_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/dashboard_screen/inventaire/add_inventaire_screen.dart';
import 'package:myflutter/domain/dashboard_screen/inventaire/all_inventaire_screen.dart';
import 'package:myflutter/domain/dashboard_screen/perte/perte_screen.dart';
import 'package:myflutter/domain/dashboard_screen/ristourne/all_ristournes_screens.dart';
import 'package:myflutter/domain/dashboard_screen/vente/add_vente_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/provider/commande_provider.dart';
import 'package:myflutter/domain/screen/filtre/etat_screen.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/produit.dart';
import 'package:provider/provider.dart';


class HomeDetailScreen extends StatefulWidget{

  HomeDetailScreen({Key key}):super(key:key);
  static const ROUTE = "employer/home";

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();


}

class _HomeDetailScreenState extends State<HomeDetailScreen>{
  List<Produit> produits = [];
  List<Commande> commandes = [];
  bool inAsyncall = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    CommandeProvider commandeProvider = Provider.of<CommandeProvider>(context);

    List<HomeInfo> listes = [
      HomeInfo(notifications: 3,title: "Commande",alertMessage: "",redirect: "",logo: Icon(Icons.cloud_download,color: Colors.white,),),
      HomeInfo(notifications: 10,title: "Add Vente",alertMessage: "",redirect:AddVenteScreen.ROUTE,logo: Icon(Icons.add_circle,color: Colors.white,)),
      HomeInfo(notifications: 58,title: "Inventaires",alertMessage: "",redirect: "",logo: Icon(Icons.airport_shuttle,color: Colors.white,)),
      HomeInfo(notifications: 12,title: "Perte",alertMessage: "",redirect: PerteScreen.ROUTE,logo: Icon(Icons.business_center,color: Colors.white,)),
      HomeInfo(notifications: 20,title: "Benefices",alertMessage: "",redirect: AllBeneficeScreen.ROUTE,logo: Icon(Icons.crop,color: Colors.white,)),
      HomeInfo(notifications: 22,title: "Etats",alertMessage: "",redirect: FilterEtatScreen.ROUTE,logo: Icon(Icons.local_bar,color: Colors.white,)),
    ];
    return ModalProgressHUD(
      inAsyncCall: inAsyncall,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //  SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logo",style: ThemeHelper.heading1(color: Colors.black)),

                  ],
                ),
              ),
              SingleChildScrollView(

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: mq.size.height - mq.padding.top),
                  child: Column(
                    children: [
                      Container(
                        width:  MediaQuery.of(context).size.width*90/100,
                        height:  MediaQuery.of(context).size.height*40/100,
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: ThemeHelper.SUCCES_COLOR,
                                    borderRadius: BorderRadius.all(Radius.circular(20))

                                ),

                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.all(2),
                                child: InkWell(
                                  onTap: (){
                                    //Navigator.of(context).pushNamed(listes[index].redirect);
                                  },
                                  child: Container(
                                    child: ListTile(
                                      title:  Text("Titre 1",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
                                      subtitle: Text("12500000 FRS",style: TextStyle(color: Colors.white,),),
                                      leading: Icon(Icons.access_alarm,color: Colors.white,),

                                    ),
                                  ),
                                )
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: ThemeHelper.SUCCES_COLOR,
                                    borderRadius: BorderRadius.all(Radius.circular(20))

                                ),

                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.all(2),
                                child: InkWell(
                                  onTap: (){
                                    //Navigator.of(context).pushNamed(listes[index].redirect);
                                  },
                                  child: Container(
                                    child: ListTile(
                                      title:  Text("titre 2",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
                                      subtitle: Text("2500000 FRS",style: TextStyle(color: Colors.white,),),
                                      leading: Icon(Icons.access_alarm,color: Colors.white,),
                                    ),
                                  ),
                                )
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: ThemeHelper.SUCCES_COLOR,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                    
                                ),

                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.all(2),
                                child: InkWell(
                                  onTap: (){
                                    //Navigator.of(context).pushNamed(listes[index].redirect);
                                  },
                                  child: Container(
                                    child: ListTile(
                                      title:  Text("Titre 3",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
                                      subtitle: Text("89500000 FRS",style: TextStyle(color: Colors.white,),),
                                      leading: Icon(Icons.access_alarm,color: Colors.white,),

                                    ),
                                  ),
                                )
                            )

                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                          height: MediaQuery.of(context).size.height*40/100,
                          width: MediaQuery.of(context).size.width*90/100,
                          child: GridView.builder(
                            itemCount: (listes == null)?0:listes.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 6),
                            itemBuilder: (BuildContext context,int index){
                              return Container(
                                  padding: EdgeInsets.all(5),
                                  child: Card(
                                    elevation: 10,
                                    child: InkWell(
                                      onTap: (){
                                         // Navigator.of(context).pushNamed(listes[index].redirect);
                                        print("____ position____"+index.toString());
                                        if(index == 0){
                                          selectChoiceCommande(commandeProvider,authProvider);
                                        }else if(index == 2){
                                          selectChoiceInventaire();

                                        }else if(index == 4){
                                          selectChoiceBenefice();

                                        }else{
                                          Navigator.pushNamed(context,listes[index].redirect );

                                        }
                                      },
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: ThemeHelper.SUCCES_COLOR,
                                                  shape: BoxShape.circle
                                              ),
                                              child: Container(
                                                  padding: EdgeInsets.all(1),
                                                  child: listes[index].logo),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 1,bottom: 1),
                                              child: Text(listes[index].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              );
                            },
                          )

                      ),
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

  void selectChoiceCommande(CommandeProvider commandeProvider,AuthProvider authProvider){
    showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: new Text("Select Choice"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, AddCommandeScreen.ROUTE);
                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.add_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Nouvelle",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                       // findAllCommande(commandeProvider, authProvider);

                       // CommandeArgs cmd = CommandeArgs(commandes: commandes,authProvider: authProvider);

                        Navigator.pushNamed(context, AllCommandeScreen.ROUTE);

                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.check_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Tout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 8,color: Colors.black,),
              Container(
                padding: EdgeInsets.all(15),
                child: SecondaryButton(text: 'Cancel',onPressed: (){Navigator.of(context).pop();},),

              )

            ],
          )
        ],
      );
    });
  }

  void selectChoiceInventaire(){
    showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: new Text("Select Choice"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, AddInventaireScreen.ROUTE);
                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.add_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Nouveau",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, AllInventaireScreen.ROUTE);

                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.check_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Tout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 8,color: Colors.black,),
              Container(
                padding: EdgeInsets.all(15),
                child: SecondaryButton(text: 'Cancel',onPressed: (){Navigator.of(context).pop();},),

              )

            ],
          )
        ],
      );
    });
  }

  void selectChoiceBenefice(){
    showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: new Text("Select Choice"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, AllBeneficeScreen.ROUTE);
                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.add_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Marge",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, AllRistourneScreen.ROUTE);

                      },
                      child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: ThemeHelper.SUCCES_COLOR),
                              child: Center(child: Icon(Icons.check_circle,color: Colors.white,))),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Ristourne",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 8,color: Colors.black,),
              Container(
                padding: EdgeInsets.all(15),
                child: SecondaryButton(text: 'Cancel',onPressed: (){Navigator.of(context).pop();},),

              )

            ],
          )
        ],
      );
    });
  }

  findAllCommande(CommandeProvider commandeProvider,AuthProvider authProvider) async {
    setState(() {
      inAsyncall = true;
    });
  List<Commande> cmds =  await commandeProvider.findCommandeByCreateur(authProvider.token);
  print(cmds);

    CommandeArgs cmd = CommandeArgs(commandes: cmds,authProvider: authProvider);
    Navigator.pushNamed(context, AllCommandeScreen.ROUTE);
  setState(() {
    inAsyncall = false;
    commandes = cmds;
  });

  }



}
class HomeInfo {
  int notifications;
  String title;
  String alertMessage;
  String redirect;
  Icon logo;

  HomeInfo(
      {this.notifications, this.title, this.alertMessage, this.redirect, this.logo});
}