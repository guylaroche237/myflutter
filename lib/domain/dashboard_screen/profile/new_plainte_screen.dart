import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';

class NewPlainteScreen extends StatefulWidget{
  static const ROUTE = "add_plt";
_NewPlainteScreenState createState() => _NewPlainteScreenState();
}


class _NewPlainteScreenState extends State<NewPlainteScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var mylist = new List(5);
  String selectProduits ;
  String selectFabriquant;
  int qte;
  double prixUnitaire = 560;

  var produits = ["Petite Guinness","33 export","Malta Guiness","Castel","Pamplemousse","Guinness Smoot","UCB"];
  var fabriquant = ["Guinness","Brasserie","kADJI","Tous"];
  Map<String,dynamic> plaintes = {
    "entreprises":["guinness","brasserie","kadji","ucb","entre1","entre2","entre3"],
    "type":["Livraison","Ristourne Impaye","Ristourne Mal Payer","Service","Avaris Non Changes"],
    "plainte":{
      "Livraison":["Livraison Irreguliere","Pas Livrer Depuis Une Semaine","Veut creer un Compte","Jour De Livraison Pas Respecter","Manque de Produit","Autre"],
      "Ristourne Impaye":["Trimestre Reclamer"],
      "Ristourne Mal Payer":["Trimestre Reclamer"],
      "Service":["Vendeur","Chef Secteur","Activites Marketing","Materiel","Frigo"],
      "Avaris Non Changes":["marque1","marque2","marque3","marque4","marque5","marque6"],
      "":[""]
    },

  };

  String entreprise ,plainte,typeplainte="",last;


  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mq = MediaQuery.of(context);
    // TODO: implement build
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: _mq.size.height - _mq.padding.top),
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
                              "New Plainte",
                              style: ThemeHelper.heading1(color: Colors.black),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BlackOutlineDropdownButton(
                        onChanged: (value) {
                          setState(() {
                            entreprise = value;
                          });
                        },
                        items: List<DropdownMenuItem>.from(
                            plaintes["entreprises"].map((v) => DropdownMenuItem(
                                child: Text(
                                  v,
                                  style: ThemeHelper.paragraph(
                                      color: Colors.black),
                                ),
                                value: v))),
                        hint: entreprise == null ? "Select Entreprise" : entreprise,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BlackOutlineDropdownButton(
                        onChanged: (value) {
                          setState(() {
                            typeplainte = value;
                            plainte = null;
                          });
                        },
                        items: List<DropdownMenuItem>.from(
                            plaintes["type"].map((v) => DropdownMenuItem(
                                child: Text(
                                  v,
                                  style: ThemeHelper.paragraph(
                                      color: Colors.black),
                                ),
                                value: v))),
                        hint: typeplainte == "" ? "Type de Plainte" : typeplainte,
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      BlackOutlineDropdownButton(
                        onChanged: (value) {
                          setState(() {
                            plainte = value;
                          });
                        },
                        items: List<DropdownMenuItem>.from(
                            plaintes["plainte"][typeplainte].map((v) => DropdownMenuItem(
                                child: Text(
                                  v,
                                  style: ThemeHelper.paragraph(
                                      color: Colors.black),
                                ),
                                value: v))),
                        hint: plainte == null ? "Select Plainte" : plainte,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      (typeplainte != "")?BlackOutlineTextField(
                          onChanged: (v) {
                            setState(() {
                              last = v.toString();
                            });
                          },
                          hintText:(typeplainte == "Livraison" || typeplainte == "Service")?"Commentaire":((typeplainte =="Avaris Non Changes")?"Quantite":"Somme Impayer"),
                          keyboardType: (typeplainte == "Livraison" || typeplainte == "Service")?TextInputType.text: TextInputType.number,
                          validator: (value) {
                            if (!Validator.isNotEmpty(value)) {
                              return "Please enter a valid produit quantite";
                            }
                            return null;
                          }):SizedBox(),

                      SizedBox(
                        height: 8,
                      ),

                       SecondaryButton(
                        text: "Valid Commande",
                        onPressed: (){},
                      )


                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }



}
