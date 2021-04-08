

import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/agent/register_success_screen.dart';
import 'package:myflutter/domain/dashboard_screen/agent/success_arg.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/screen/login_screen/login_screen.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_password_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_text_field.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/register_request.dart';
import 'package:myflutter/model/role.dart';
import 'package:myflutter/model/user_register_dto.dart';
import 'package:provider/provider.dart';


class RegisterUserScreen extends StatefulWidget {
  RegisterUserScreen({Key key,}) : super(key: key);
  // final Role role;
  static const ROUTE = "/agent/register";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _pass;
  String _email;
  String phone;
  String selectCategorie;
  String selectTypeRegime;
  String nom ,prenom, nomPointVente = "";
  // Role _selectedRole;
  bool _termsAccepted;
  bool _inAsyncCall = false;
  var categories = [ "ENTREPRISE", "SNACK", "BAR", "DEPOT", "CAVE", "BOITE_NUIT" ];
  var typeRegime = [ "SIMPLIFIE", "LIBERATOIRE", "REEL" ];


  @override
  void initState() {
    super.initState();
    _termsAccepted = false;
    _email = "";
    //  _selectedRole = widget.role;
    _password = "";
    phone = "";
    _pass = "";

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        body: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: _inAsyncCall,
              child: Center(
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: mq.size.height - mq.padding.top),
                          child: ContainerWithBackground(
                              backgroundUrl: "assets/images/background.png",
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "Sign up",
                                              style: ThemeHelper.heading1(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                          flex: 10,
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                LightTextField(
                                                  validator: (value) {
                                                    if (!Validator.isNotEmpty(value)) {
                                                      return "The value entered is not valid";
                                                    }
                                                    return null;
                                                  },
                                                  hintText: "Nom Utilisateur",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      nom = value.trim();
                                                    });
                                                  },
                                                ),
                                                LightTextField(
                                                  validator: (value) {
                                                    if (!Validator.isNotEmpty(value)) {
                                                      return "The value entered is not valid";
                                                    }
                                                    return null;
                                                  },
                                                  hintText: "Prenom Utilisateur",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      prenom = value.trim();
                                                    });
                                                  },
                                                ),
                                                LightTextField(
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
                                                LightTextField(
                                                  keyboardType: TextInputType.phone,
                                                  validator: (value) {
                                                    if (!Validator.isNotEmpty(value)) {
                                                      return "The value entered is not valid";
                                                    }
                                                    return null;
                                                  },
                                                  hintText: "Numero Telephone",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      phone = value.trim();
                                                    });
                                                  },
                                                ),
                                                LightTextField(
                                                  validator: (value) {
                                                    if (!Validator.isNotEmpty(value)){
                                                      return "The value entered is not valid";
                                                    }
                                                    return null;
                                                  },
                                                  hintText: "Nom Point Vente",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      nomPointVente = value.trim();
                                                    });
                                                  },
                                                ),

                                                BlackOutlineDropdownButton(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectCategorie = value;
                                                    });
                                                  },
                                                  items: List<DropdownMenuItem>.from(
                                                      categories.map((v) => DropdownMenuItem(
                                                          child: Text(
                                                            v,
                                                            style: ThemeHelper.paragraph(
                                                                color: Colors.black),
                                                          ),
                                                          value: v))),
                                                  hint: selectCategorie == null ? "Choose Categorie" : selectCategorie,
                                                ),

                                                BlackOutlineDropdownButton(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectTypeRegime = value;
                                                    });
                                                  },
                                                  items: List<DropdownMenuItem>.from(
                                                      typeRegime.map((v) => DropdownMenuItem(
                                                          child: Text(
                                                            v,
                                                            style: ThemeHelper.paragraph(
                                                                color: Colors.black),
                                                          ),
                                                          value: v))),
                                                  hint: selectTypeRegime == null ? "Choose Regime" : selectTypeRegime,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Theme(
                                                      data: ThemeData(
                                                          unselectedWidgetColor:
                                                          Colors.white),
                                                      child: Checkbox(
                                                        activeColor: Colors.blue,
                                                        value: _termsAccepted ?? false,
                                                        onChanged: (bool value) {
                                                          setState(() {
                                                            _termsAccepted = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      "Agree terms and conditions",
                                                      style: ThemeHelper.paragraph(),
                                                    ),
                                                  ],
                                                ),
                                                SecondaryButton(
                                                    onPressed: () {
                                                      _attemptRegistration(authProvider);
                                                    },
                                                    text: "Sign up"),

                                                SizedBox()
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  )))))),
            )));
  }

  Future<void> _showTermAndServicesDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and condition'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'By registering to RendezVousService, you agree with terms and conditions'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
                //_socialRegistration(authProvider, provider);
              },
            ),
            FlatButton(
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _validate() {
    if (!_formKey.currentState.validate()) {
      return false;
    }


    return true;
  }

  void _attemptRegistration(AuthProvider authProvider) async {
    setState(() {
      _password = getPassword();
    });


    if (!_validate()) {
      return;
    }
    setState(() {
      _inAsyncCall = true;
    });
    UserRegisterDto userRegisterDto = UserRegisterDto(username: phone,nom: nom,prenom: prenom,password: _password,telephone: phone,email: _email,role: Role.owner().name,createur: authProvider.token.id.toString(),nomPointVente: nomPointVente,nomCommercial: nomPointVente,categorie: selectCategorie,typeRegime: selectTypeRegime,region: "Littoral",ville: "Douala",quartier: "Deido");

   RegisterRequest registerRequest = RegisterRequest(userRegisterDto,authProvider.token);
    try {
      await ApiClient.execOrFail(registerRequest);
      SuccessArgs args = SuccessArgs(phone,_password);
      onRegistrationSuceed(args);
    } catch (err) {
      _onRegistrationFailed(err);
    }
    setState(() {
      _inAsyncCall = false;
    });

  }

  void onRegistrationSuceed(SuccessArgs args,{String message}) {
    Navigator.pushReplacementNamed(context, RegisterSuccessScreen.ROUTE,arguments: args);
    BotToast.showSimpleNotification(
        title: message ??
            "Creation Manager effectuer",
        duration: Duration(minutes: 1));

  }

  void _socialRegistration() async {


  }

  void _onRegistrationFailed(err) {
    if (err is AbstractApiError) {
     // err.toToast(context);
      BotToast.showSimpleNotification(title: "Username Or Email are already Take");
    } else {
      BotToast.showSimpleNotification(title: "Unexpected error, please try again");
    }

  }

  String getPassword(){
    var chars = '0123456789ABCDEFGHIJKLMNOPQRSTVWXYZabcdefghijklmnopqrstvwxz';
    var result = "";

    for(var i = 5;i>0;i--){
      var random = Random();
      result += chars[random.nextInt(chars.length-1)];
    }

    print(result);
    return result;
  }
}
