import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_password_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_text_field.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/register_request.dart';
import 'package:myflutter/model/token.dart';
import 'package:myflutter/model/user.dart';
import 'package:myflutter/model/user_register_dto.dart';
import 'package:provider/provider.dart';

class RegisterWorkerScreen extends StatefulWidget{

  static const ROUTE = "/register/worker";
  const RegisterWorkerScreen({Key key,}) : super(key: key);

  _EditeProfileScreenState createState() => _EditeProfileScreenState();

}

class _EditeProfileScreenState extends State<RegisterWorkerScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var roles = ["USER_STOCK","USER_SALE"];
  String selectRole;
  String _password,nom,prenom,_email;
  bool inAsyncCall = false;
  String phone;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _password = "";
    nom = "";
    prenom = "";


  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // TODO: implement build
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        appBar:  dahshboardAppBar(context, title: "New Worker"),
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackOutlineTextField(
                          hintText: "Nom",
                          onChanged: (value) {
                            setState(() {
                              nom = value;
                            });

                          },
                          validator: (value) {
                            if (!Validator.isNotEmpty(value)) {
                              return "S'il vous plait entrer votre nom";
                            }
                            return null;
                          }),
                      SizedBox(height: 4,),
                      Divider(height: 1,),
                      BlackOutlineTextField(
                          hintText: "Prenom",
                          onChanged: (value) {
                            setState(() {
                              prenom = value;
                            });

                          },
                          validator: (value) {
                            if (!Validator.isNotEmpty(value)) {
                              return "S'il Vous Plait entrer votre Prenom";
                            }
                            return null;
                          }),

                      SizedBox(height: 8,),

                      Divider(height: 1,),

                      BlackOutlineTextField(
                        keyboardType:
                        TextInputType.phone,
                        //initialValue: authProvider.getEmail(),
                        hintText: "Numero  Telephone",
                        onChanged: (value) {
                          String v = value;
                          setState(() {
                            phone = v.trim();
                          });
                        },
                        validator: (value) {
                          if (!Validator.isNotEmpty(value)) {
                            return "The value entered is not valid";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8,),

                      Divider(height: 1,),

                      BlackOutlineTextField(
                        validator: (value) {
                          if (!(Validator.isEmail(value) &&
                              Validator.isNotEmpty(value))) {
                            return "The value entered is not valid";
                          }
                          return null;
                        },
                        hintText: "Your Email",
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
                      ),

                      SizedBox(height: 8,),

                      Divider(height: 1,),

                      BlackOutlineTextField(
                        hintText: "Your password",
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                            //_email = authProvider.getEmail();
                          });
                        },
                        validator: (value) {
                          if (!(Validator.isNotEmpty(value) &&
                              value.length >= 4)) {
                            return "The entered value is not valid (min length: 4)";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8,),

                      Divider(height: 1,),


                      BlackOutlineDropdownButton(
                        onChanged: (value) {
                          setState(() {
                            selectRole = value;
                          });
                        },
                        items: List<DropdownMenuItem>.from(
                            roles.map((v) => DropdownMenuItem(
                                child: Text(
                                  v,
                                  style: ThemeHelper.paragraph(
                                      color: Colors.black),
                                ),
                                value: v))),
                        hint: selectRole == null ? "Choose Role" : selectRole,
                      ),

                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryButton(
                                text: "Enregistrer",
                                onPressed: () {
                                  UserRegisterDto userDto = UserRegisterDto(telephone: phone,username: phone,prenom: prenom,nom: nom,password: _password,email: _email,role: selectRole,createur: authProvider.token.id.toString(),
                                  nomPointVente: authProvider.user.pointVente.nomPointVente,nomCommercial: authProvider.user.pointVente.nomCommercial,
                                  categorie: authProvider.user.pointVente.categorie,typeRegime: authProvider.user.pointVente.typeRegime,
                                  region: authProvider.user.pointVente.region,ville: authProvider.user.pointVente.ville,quartier: authProvider.user.pointVente.quartier);

                                  if(Validator.isNotEmpty(selectRole)){
                                    saveWorker(authProvider.token, userDto);
                                  }else{
                                    BotToast.showSimpleNotification(title: "Choisissez un role svp",duration: Duration(seconds: 30));

                                  }
                                },
                              ),
                              SecondaryButton(
                                text: "Annuler",
                                onPressed: () {

                                },
                              ),
                            ],
                          )),

                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

 Future<void> saveWorker(Token token,UserRegisterDto userRegisterDto) async {
   if (!_formKey.currentState.validate()) {
     return;
   }
   setState(() {
     inAsyncCall = true;
   });

   RegisterRequest registerRequest = RegisterRequest(userRegisterDto,token);
   try {
     await ApiClient.execOrFail(registerRequest);
     setState(() {
       inAsyncCall = false;
     });
     BotToast.showSimpleNotification(title: "Compte Creer Avec Succes",duration: Duration(seconds: 30));
     Navigator.pop(context);

   } catch (err) {
     BotToast.showSimpleNotification(title: "Creation Echouer",duration: Duration(seconds: 30));
   }
   setState(() {
     inAsyncCall = false;
   });
 }

}