import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_args.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/provider/commande_provider.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/commande_livrer_card.dart';
import 'package:myflutter/domain/widget/layout/commande_livrer_item_list_detail.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/livraison_amount_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_date_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_fournisseur_detail.dart';
import 'package:myflutter/domain/widget/layout/livraison_item_list_detail.dart';
import 'package:myflutter/model/details_commande.dart';
import 'package:myflutter/model/livraison.dart';
import 'package:myflutter/model/token.dart';
import 'package:provider/provider.dart';

import 'command_args.dart';

class CommandeLivrerDetailScreen extends StatefulWidget {
  CommandeLivrerDetailScreen({Key key, this.args}) : super(key: key);
  static const ROUTE = "/details/";
  final LivraisonArgs  args;

  @override
  StockDetailsSreenState createState() => StockDetailsSreenState();
}

class StockDetailsSreenState extends State<CommandeLivrerDetailScreen> {
  final myController = TextEditingController();
  String numFacture;
  var produits = ["Guinness","Depot Ltd","Ma Mado ","Brasserie","Le Vatican Depot","Kadji","UCB"];
  List<String> titles = ["Titre 1","Titre 2","Titre 3","Titre 4","Titre 5","Titre 6","Titre 7","Titre 8"];
  var fabriquant = ["Guinness","Brasserie","kADJI","Tous"];

  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  var _sugestionTextFieldController = new TextEditingController();
  String distributeur = "";
  String selectDistributeur="";
  bool inAsyncoll = false;
  List<Data> modifs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.args.livraison.commande.toJson());
    print("-----------------------------------------");
    print(widget.args.livraison.fournisseur);


  }


  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    CommandeProvider commandeProvider = Provider.of<CommandeProvider>(context);


    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Detail Commande Livrer"),
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: EdgeInsets.only(top: 6,left: 6),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LivraisonDateDetail(livraison: widget.args.livraison,),
                        SizedBox(height: 1),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: LivraisonFournisseurDetail(livraison: widget.args.livraison,),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        FilterArgumentRow(
                          label: "Numero Facture",
                          isColumn: false,
                          child:  Container(
                            padding: EdgeInsets.all(3),
                            child: BlackOutlineTextField(
                                onChanged: (v) {
                                  setState(() {
                                    numFacture = v ;
                                  });
                                },
                                hintText:"Numero Facture",
                                initialValue: "",
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (!Validator.isNotEmpty(value)) {
                                    return "Please enter a valid produit quantite";
                                  }
                                  return null;
                                }),
                          ),
                        )
                        /*ListTile(
                          title: Text("Numero Facture",style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(numFacture??"vide"),
                          trailing: IconButton(icon: Icon(Icons.edit,color: Colors.blue,), onPressed: (){ _showDialogUpdateFactureNum();}),
                        ),*/,
                     /**  Divider(height: 2,color: Colors.black,),
                       FilterArgumentRow(
                         label: "Distributeur",
                         isColumn: false,
                         child: Container(
                           padding: EdgeInsets.all(3),
                           child: BlackOutlineTextField(
                               onChanged: (v) {
                                 setState(() {
                                   //prixUnitaire = v ;
                                 });
                               },
                               hintText:"Nom Distributeur",
                               initialValue: "",
                               keyboardType: TextInputType.text,
                               validator: (value) {
                                 if (!Validator.isNotEmpty(value)) {
                                   return "Please enter a valid produit quantite";
                                 }
                                 return null;
                               }),
                         ),

                       ),**/
                       /** Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LivraisonAmountDetail(livraison: widget.args.livraison,),
                        ),**/
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Liste Des Produits Commandes", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
                                SizedBox(height: 8),
                                Container(
                                    padding: EdgeInsets.only(left: 5,right: 10),
                                    child: Column(
                                      children: widget.args.livraison.commande.detailsCommande.map((e) {
                                        DetailsCommande detailsCmd = e;
                                        CommandeArgs cmd = CommandeArgs() ;
                                        //CommandeArgs(nomProduit: e,qte:22,prixUnitaire: 100 );
                                        cmd.nomProduit = "pierre";
                                        cmd.qte = 45;
                                        cmd.prixUnitaire = 75;
                                        // ListTile(title: Text(list[index].title),subtitle: Text(list[index].qte.toString()),);
                                        return Card(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          elevation: 2,
                                          child: Padding(padding: EdgeInsets.all(1),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: ListTile(
                                                    title: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(detailsCmd.produit.nom,style: TextStyle(fontWeight: FontWeight.bold),)
                                                      ],
                                                    ),
                                                    subtitle: Text(detailsCmd.prixTotalCmde.toString()+" Frs"),
                                                    // trailing: IconButton(icon: Icon(Icons.edit,color: Colors.blue,),onPressed: (){this.onPressed();},),

                                                  ),
                                                ),
                                                Divider(height: 8,),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Qte Cmd : "+detailsCmd.qteCommandee.toString()),
                                                      Container(
                                                        padding: EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Qte Lvre :"),
                                                            InkWell(
                                                              onTap: (){
                                                                _showDialogUpdateQuantite(e.id);
                                                                setState(() {
                                                                    cmd.qteLivrer = 12;

                                                                });
                                                              },
                                                              child: Container(
                                                                  margin: EdgeInsets.only(left: 5),
                                                                  width: 40,
                                                                  height: 40,
                                                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blueGrey),
                                                                  child: Center(child: Text(getVal(e.id)))),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                          //CommandeLivrerCard(args: cmd,onPressed: (){_showDialogUpdateQuantite();},);

                                      }
                                      ).toList(),


                                    )
                                )
                              ]
                          ),
                          //CommandeLivrerItemListDetail(livraison: widget.args.livraison,),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(text: "Valid",onPressed: (){
                        Livraison tmp = widget.args.livraison;
                        print(tmp.commande.toJson());
                        print(tmp.commande.detailsCommande.length);
                        Livraison livr = Livraison(fournisseur: "laroche",prixTotal: 500,commande: tmp.commande,numFacture: numFacture,createur: authProvider.token.id.toString(),quantiteProduit: tmp.commande.detailsCommande.length);
                        saveLivraison(widget.args.livraison, commandeProvider, authProvider.token);
                      },),
                      SecondaryButton(text: "Cancel",onPressed: (){
                        Navigator.pop(context);
                      },)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _showDialogUpdateFactureNum() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          title: new Text("Update Facture"),
          content: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.9,
                  child:TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "facture Id",
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(text: 'Save',onPressed: (){
                        if(Validator.isNotEmpty(myController.text)){
                          setState((){
                            numFacture = myController.text;
                            Navigator.of(context).pop();
                            myController.text="";
                          });
                        }else{
                          //Toast.show("Champ Invalid !!", context,duration: Toast.LENGTH_LONG,gravity: Toast.TOP);
                        }

                      },),
                      SecondaryButton(text: 'Close',onPressed: (){Navigator.of(context).pop();},)
                    ],
                  ),
                )
              ],
            ),

          ],
        );

      },
    );
  }

  void _showDialogSelectDistributeur() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          title: new Text("Select Distributeur"),
          content: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.9,
                  child:AutoCompleteTextField(
                    controller: _sugestionTextFieldController,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    clearOnSubmit: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)

                        )
                    ),
                    itemSubmitted: (item){
                      _sugestionTextFieldController.text = item;
                      setState(() {
                        distributeur = item;
                      });
                    },
                    key: key,
                    suggestions: produits,
                    itemBuilder:(context, item) => new Padding(
                        child: new ListTile(
                          title: new Text(item),

                        ),
                        padding: EdgeInsets.all(8.0)),
                    itemSorter: (a, b) => a.compareTo(b),
                    itemFilter: (suggestion, input) => suggestion.toLowerCase().startsWith(input.toLowerCase()),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(text: 'Save',onPressed: (){
                        if(Validator.isNotEmpty(distributeur)){
                          setState((){
                            Navigator.of(context).pop();
                          });
                        }else{
                          //Toast.show("Champ Invalid !!", context,duration: Toast.LENGTH_LONG,gravity: Toast.TOP);
                        }
                      },),
                      SecondaryButton(text: 'Close',onPressed: (){Navigator.of(context).pop();},)
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }



  int  _showDialogUpdateQuantite(int pos){
    int value = 0 ;

    showDialog(context : context,builder: (BuildContext context){
      return AlertDialog(
        title: new Text("Quantite Livrer"),
        content: new Text(""),
        actions: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.9,
                child:TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quantite",
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.9,
                padding: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(text: 'Save',onPressed: (){
                      if(Validator.isNotEmpty(myController.text)){
                        setState((){
                          Data data = Data(pos: pos,val: int.parse(myController.text));
                          modifs.add(data);
                          value = int.parse(myController.text);
                          Navigator.of(context).pop();
                          myController.text="";
                        });

                      }else{

                      }

                    },),
                    SecondaryButton(text: 'Close',onPressed: (){Navigator.of(context).pop();},)
                  ],
                ),
              )
            ],

          )

        ],

      );
    });
    return value;

  }

  saveLivraison(Livraison livrai,CommandeProvider commandeProvider,Token token) async {
    setState(() {
      inAsyncoll = true;
    });
    Livraison livraison = await commandeProvider.saveLivraison(livrai, token);
    setState(() {
      inAsyncoll = false;
    });
    if(livraison.id != null){
      BotToast.showSimpleNotification(title: "Livraison Confirmer");
      Navigator.pop(context);

    }else{
      BotToast.showSimpleNotification(title: "Requete Echouer !!!");

    }

  }

  getVal(int id){
    int res = 0;
    if(modifs.length > 0){
      modifs.forEach((element) {
        if(element.pos == id){
          res = element.val;
        }
      });
    }
    return res.toString();
  }


}

class Data{
  int pos;
  int val;

  Data({this.pos,this.val});
}