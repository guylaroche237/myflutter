
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/dashboard_screen/perte/perte_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/commande_card.dart';
import 'package:myflutter/domain/widget/layout/filter_argument_row.dart';
import 'package:myflutter/model/produit.dart';

class AddInventaireScreen extends StatefulWidget{
  static const ROUTE = "add_inv";

  _AddCommandeScreenState createState()=> _AddCommandeScreenState();

}
class _AddCommandeScreenState extends State<AddInventaireScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var mylist = new List(5);
  String selectProduits ;
  String selectFabriquant;
  int qteb;
  int qtec;
  List<Vente> list = [];


  Produit pro = Produit(fabriquant: "Guiness",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 550,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro1 = Produit(fabriquant: "Brasserie",nom: "33 export",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 700,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro2 = Produit(fabriquant: "Kadji",nom: "Kqdji Biere",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 246,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro3 = Produit(fabriquant: "Guiness",nom: "Malta Guinness",type: "jus",lot: "bouteille",quantite: 7,prixAchat1: 244,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro4 = Produit(fabriquant: "Brasserie",nom: "Castel",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 2444,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro5 = Produit(fabriquant: "UCB",nom: "Pamplemousse",type: "jus",lot: "bouteille",quantite: 100,prixAchat1: 2450,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 50,produitstatus: "NORMALE",siParisable: true,);
  Produit pro6 = Produit(fabriquant: "Kadji",nom: "Guinness Smoot",type: "biere",lot: "bouteille",quantite: 100,prixAchat1: 504,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 12,produitstatus: "NORMALE",siParisable: true,);
  Produit pro7 = Produit(fabriquant: "UCB",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 36,prixAchat1: 900,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 32,produitstatus: "NORMALE",siParisable: true,);
  Produit pro8 = Produit(fabriquant: "Guiness",nom: "grande guiness",type: "biere",lot: "bouteille",quantite: 31,prixAchat1: 400,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 6,produitstatus: "NORMALE",siParisable: true,);
  var produits = ["Petite Guinness","33 export","Malta Guiness","Castel","Pamplemousse","Guinness Smoot","UCB"];
  var fabriquant = ["Guinness","Brasserie","kADJI","Tous"];


  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  var _sugestionTextFieldController = new TextEditingController();






  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mq = MediaQuery.of(context);
    // TODO: implement build
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: _mq.size.height - _mq.padding.top),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(

                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Inventaire",
                              style: ThemeHelper.heading1(color: Colors.black),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FilterArgumentRow(
                        isColumn: true,
                        label: "choisir le Produit",
                        child: AutoCompleteTextField(
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
                              selectProduits = item;
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
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: BlackOutlineTextField(
                                onChanged: (v) {
                                  setState(() {
                                    qteb = int.parse(v.toString());
                                  });
                                },
                                hintText:"Quantite Bouteille",
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (!Validator.isNotEmpty(value)) {
                                    return "Please enter a valid produit quantite";
                                  }
                                  return null;
                                }),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: BlackOutlineTextField(
                                onChanged: (v) {
                                  setState(() {
                                    qtec = int.parse(v.toString());
                                  });
                                },
                                hintText:"Quantite Casier",
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (!Validator.isNotEmpty(value)) {
                                    return "Please enter a valid produit quantite";
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      (selectProduits != null && qteb != null)?PrimaryButton(
                        text: "Insert Produit",
                        onPressed: (){
                          Vente cmd = Vente(title: selectProduits,qteb: qteb,qtec: qtec);
                          setState(() {
                            list.add(cmd);
                            selectProduits = null;
                            qteb = null;
                            qtec = null;
                          });
                        },
                      ):SizedBox(),
                      Divider(height: 8,color: Colors.black,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.3,
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context,index){
                              // return ListTile(title: Text(list[index].title),subtitle: Text(list[index].qte.toString()),);
                              CommandeArgs cmd = CommandeArgs(nomProduit: list[index].title,qte:list[index].qteb,qtec:list[index].qtec,prixUnitaire: 100 );
                              // ListTile(title: Text(list[index].title),subtitle: Text(list[index].qte.toString()),);
                              return CommandeCard(args: cmd,onPressed: (){
                                removeCommande(cmd);
                              },);
                            } ),
                      ),
                      (list.length > 0)? Align(
                        alignment: Alignment.bottomCenter,

                        child: SecondaryButton(
                          text: "Valid Inventaire",
                          onPressed: (){},
                        ),
                      ):SizedBox()


                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void removeCommande(CommandeArgs args){
    showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.announcement,color: Colors.red,),
              Text("Remove This Element")
            ],
          ),
        ),
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
                    Container(
                      padding: EdgeInsets.all(15),
                      child: PrimaryButton(text: 'No',onPressed: (){Navigator.of(context).pop();},),

                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: SecondaryButton(text: 'YES',onPressed: (){
                        Navigator.of(context).pop();
                        int pos = 0;
                        int i = 0;
                        list.forEach((element) {
                          if(element.title == args.nomProduit){
                            print("element trouver");
                            pos = i;
                          }
                          i++;
                        });
                        setState(() {
                          //
                          list.removeAt(pos);



                        });
                      },),

                    )


                  ],
                ),
              ),
              Divider(height: 8,color: Colors.black,),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Text("Cet Inventaire sera retirer de la liste")

              )

            ],
          )
        ],
      );
    });
  }

}