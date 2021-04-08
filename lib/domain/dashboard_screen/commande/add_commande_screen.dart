import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/commande/command_args.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/provider/commande_provider.dart';
import 'package:myflutter/domain/provider/global.dart';
import 'package:myflutter/domain/provider/produit_provider.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/commande_card.dart';
import 'package:myflutter/domain/widget/layout/filter_argument_row.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/find_all_produit_request.dart';
import 'package:myflutter/model/commande.dart';
import 'package:myflutter/model/details_commande.dart';
import 'package:myflutter/model/fournisseur.dart';
import 'package:myflutter/model/produit.dart';
import 'package:provider/provider.dart';

class AddCommandeScreen extends StatefulWidget{
  static const ROUTE = "add_cmd";


  _AddCommandeScreenState createState()=> _AddCommandeScreenState();

}

class _AddCommandeScreenState extends State<AddCommandeScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Fournisseur tmp ;
  ProduitProvider produitProvider;
  AuthProvider authProvider;
  CommandeProvider cmdProvider;
  Produit selectProduits ;
  String selectFabriquant;
  int qte;
  List<Commande> list = [];
  List<Fournisseur> fournisseurs = [];
  Fournisseur selectFournisseur;
  double prixUnitaire = 560;
  bool isAsyncroll = false;
  List<Produit> prods = [] ;
  List<DetailsCommande> detailsCmd = [];

  GlobalKey<AutoCompleteTextFieldState<Produit>> key = new GlobalKey();

  AutoCompleteTextField fourniseurTextField;
  GlobalKey<AutoCompleteTextFieldState<Fournisseur>> fkey = new GlobalKey();
  var _sugestionTextFieldController = new TextEditingController();
  var _sugestionTextFieldControllerfournisseur = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authProvider = Provider.of<AuthProvider>(context,listen: false);
    produitProvider = Provider.of<ProduitProvider>(context,listen: false);
    cmdProvider = Provider.of<CommandeProvider>(context,listen: false);
    getAllProduits(authProvider, produitProvider,cmdProvider);
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mq = MediaQuery.of(context);
    CommandeProvider commandeProvider = Provider.of<CommandeProvider>(context);
    // TODO: implement build
    return  Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isAsyncroll,
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
                                "New Commande",
                                style: ThemeHelper.heading1(color: Colors.black),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.45,
                              child: BlackOutlineDropdownButton(
                                onChanged: (value) {
                                  setState(() {
                                    selectFabriquant = value;
                                  });
                                },
                                items: List<DropdownMenuItem>.from(
                                    Global.getListFabriquant().map((v) => DropdownMenuItem(
                                        child: Text(
                                          v,
                                          style: ThemeHelper.paragraph(
                                              color: Colors.black),
                                        ),
                                        value: v))),
                                hint: selectFabriquant == null ? "Fabriquant" : selectFabriquant,
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width*0.45,
                              child: BlackOutlineDropdownButton(
                                onChanged: (value) {
                                  setState(() {
                                    selectFournisseur = value;
                                  });
                                },
                                items: List<DropdownMenuItem>.from(
                                    fournisseurs.map((v) => DropdownMenuItem(
                                        child: Text(
                                          v.nom,
                                          style: ThemeHelper.paragraph(
                                              color: Colors.black),
                                        ),
                                        value: v))),
                                hint: selectFournisseur == null ? "Fournisseur" : selectFournisseur.nom,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        (prods.length != 0)?FilterArgumentRow(
                          isColumn: true,
                          label: "Choisir Le Produit",
                          child: AutoCompleteTextField<Produit>(
                            controller: _sugestionTextFieldController,
                            style: TextStyle(color: Colors.black,fontSize: 16),
                            clearOnSubmit: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)

                                )
                            ),
                            itemSubmitted: (item){
                              _sugestionTextFieldController.text = item.nom;
                              setState(() {
                                selectProduits = item;
                              });
                            },
                            key: key,
                            suggestions: prods,
                            itemBuilder:(context, item) => new Padding(
                                child: new ListTile(
                                  title: new Text(item.nom),

                                ),
                                padding: EdgeInsets.all(8.0)),
                            itemSorter: (a, b) => a.nom.compareTo(b.nom),
                            itemFilter: (suggestion, input) => suggestion.nom.toLowerCase().startsWith(input.toLowerCase()) || suggestion.nom.toLowerCase().contains(input.toLowerCase()),
                          ),
                        ):SizedBox(),
                    SizedBox(
                    height: 8,
                  ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: BlackOutlineTextField(
                                  onChanged: (v) {
                                    setState(() {
                                      prixUnitaire = v ;
                                    });
                                  },
                                  hintText:"Prix Unitaire",
                                  initialValue: prixUnitaire.toString(),
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
                                      qte = int.parse(v.toString());
                                    });
                                  },
                                  hintText:"Quantite Produits",
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

                        SizedBox(
                          height: 8,
                        ),
                        (selectProduits != null && qte != null)?PrimaryButton(
                          text: "Insert Produit",
                          onPressed: (){
                            print(selectFournisseur.toJson().toString());
                            Commande cmd = Commande(libelle:selectProduits.nom,id:qte.toString());
                            DetailsCommande cmdDetail = DetailsCommande(prixUnitaire: prixUnitaire.toInt(),qteCommandee: qte,prixTotalCmde: qte*prixUnitaire,produit:selectProduits,);
                            setState(() {
                              list.add(cmd);
                              detailsCmd.add(cmdDetail);
                              selectProduits = null;
                              qte = null;
                              if(selectFournisseur != null){
                                tmp = selectFournisseur;
                              }

                            });
                          },
                        ):SizedBox(),
                        Divider(height: 8,color: Colors.black,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          height: MediaQuery.of(context).size.height*0.31,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context,index){
                                CommandeArgs cmd = CommandeArgs(nomProduit: list[index].libelle,qte:int.parse(list[index].id),prixUnitaire: 100 );
                               // ListTile(title: Text(list[index].title),subtitle: Text(list[index].qte.toString()),);
                                return CommandeCard(args: cmd,onPressed: (){
                                  removeCommande(cmd);
                                },);
                              } ),
                        ),
                        (list.length > 0)? SecondaryButton(
                          text: "Valid Commande",
                          onPressed: (){
                            double totalPrix = 0;
                            detailsCmd.forEach((element) {
                              print("--------- taille de de l element");
                              totalPrix += element.prixTotalCmde;
                            });
                            print("--------------------- fournisseur infos -----------------");
                            print(tmp.nom);
                            Commande newCmd = Commande(createur: authProvider.token.id.toString(),detailsCommande: detailsCmd,fournisseur: tmp,libelle: "cmd08"+totalPrix.toString(),pointVente: authProvider.user.pointVente,prixTotal: totalPrix);
                            saveCmd(newCmd, commandeProvider);
                          },
                        ):SizedBox()


                      ],
                    ),
                  ),
                )),
          ),
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
                          if(element.libelle == args.nomProduit){
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
                child: Text("Cette Commande sera retirer de la liste")

              )

            ],
          )
        ],
      );
    });
  }

  Future<void> getAllProduits(AuthProvider authProvider,ProduitProvider produitProvider,CommandeProvider commandeProvider) async {
    setState(() {
      isAsyncroll = true;
    });
    FindAllProduitRequest findAllProduitRequest = FindAllProduitRequest(authProvider.token);
    List<Produit> list = await produitProvider.getAllProduits(authProvider.token);
    List<Fournisseur> four = await commandeProvider.allFournisseurs(authProvider.token);
    setState(() {
      isAsyncroll = false;
      prods = list;
      fournisseurs = four;
    });
  }

  Future<void> saveCmd(Commande commande,CommandeProvider commandeProvider) async {
    setState(() {
      isAsyncroll = true;
    });

    int cmd = await commandeProvider.saveCommande(authProvider, commande);
    if(cmd == 200){
      setState(() {
        isAsyncroll = false;
      });
      BotToast.showSimpleNotification(title: "Commande creer avec success !!",duration: Duration(seconds: 12));
      Navigator.pop(context);
    }else{
      setState(() {
        isAsyncroll = false;
      });
      BotToast.showSimpleNotification(title: "Creation echouer !!",duration: Duration(seconds: 12));
      
    }
  }

}

