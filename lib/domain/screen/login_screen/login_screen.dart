import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/patron_dashboard_screen.dart';
import 'package:myflutter/domain/dashboard_screen/worker_dashboard_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/screen/login_screen/update_pass_arg.dart';
import 'package:myflutter/domain/screen/login_screen/update_password_screen.dart';
import 'package:myflutter/domain/screen/registration_screeen/registration_screen.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_password_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_text_field.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/find_all_produit_request.dart';
import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/token.dart';
import 'package:provider/provider.dart';

import '../../router.dart';
import '../continu_as_screen.dart';
import 'login_screen_args.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.args,}) : super(key: key);
  final LoginScreenArgs args;
  static const ROUTE = "/login";
  //Function(Token, String) get afterLogin => args == null ? null : args.afterLogin;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone;
  String _password;
  bool _inAsyncCall = false;
  bool no_forget_me ;
  final _formKey = GlobalKey<FormState>();
  List<Produit> produits = [];




  @override
  void initState() {
    super.initState();
   // _selectedRole = widget.args.role;
   AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
  //  _email = authProvider.getEmail();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        body: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: _inAsyncCall,
              child:Center(
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: mq.size.height - mq.padding.top),
                          child: ContainerWithBackground(
                              backgroundUrl: "assets/images/background.png",
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                    //  Center(child: CircularProgressIndicator(),),
                                      Flexible(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 40),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Login",
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

                                                LightPasswordTextField(
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

                                                Row(
                                                  children: <Widget>[
                                                    Theme(
                                                      data: ThemeData(
                                                          unselectedWidgetColor:
                                                          Colors.white),
                                                      child: Checkbox(
                                                        activeColor: Colors.blue,
                                                        value: no_forget_me ?? false,
                                                        onChanged: (bool value) {
                                                          setState(() {
                                                            no_forget_me = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      "Remember-me",
                                                      style: ThemeHelper.paragraph(),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                    alignment: Alignment.topLeft,
                                                    child: InkWell(
                                                      onTap: () {


                                                      },
                                                      child: Text(
                                                          "Forgotten password ?",
                                                          style: ThemeHelper.paragraph(
                                                              isBold: true)),
                                                    )),

                                                SecondaryButton(
                                                    onPressed: () {
                                                      //_email = authProvider.getEmail();
                                                     _attemptLogin(phone,_password,authProvider);

                                                    },
                                                    text: "Login"),
                                                InkWell(
                                                  onTap: () {
                                                  /**  Navigator.of(context).pushNamed(
                                                        ContinueAsScreen.ROUTE,
                                                        arguments: (Role role) {
                                                          Navigator.pushNamed(context,
                                                              RegistrationScreen.ROUTE,
                                                              arguments: role);
                                                        });**/
                                                    Navigator.pushNamed(context, RegistrationScreen.ROUTE);
                                                  },
                                                  child: Text("Sign up instead",
                                                      style: ThemeHelper.paragraph(
                                                          isBold: true)),
                                                ),
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

  void _attemptLogin(String email,String password,AuthProvider authProvider) async {

    if (!_formKey.currentState.validate()) {
      print("form not valid");
      return;
    }

    setState(() {
      _inAsyncCall = true;
    });

    try {
      Token token =  await authProvider.login(phone, password);


      print(token.id);
      setState(() {
        _inAsyncCall = false;
      });
      try {
        this.onLoginSucess(token);
      } catch (err) {
        print(err);
      }
      return;
    } catch (err) {
      if (err is AbstractApiError) {

        BotToast.showSimpleNotification(title: "Username Or Password Not Found");
       // err.toToast(err);
      } else {
        print(err.toString());
        print(err.stackTrace);
        BotToast.showSimpleNotification(title: "Unexpected error, please try again");
      }
      setState(() {
        _inAsyncCall = false;
      });
    }

  }

  void onLoginSucess(Token token) {
    BotToast.showSimpleNotification(title: "Successfuly logged in");
    if(token.isAgent()){
      handleAgentLoginSuccess();

    }else if(token.isOwner()){
      if(token.isActive){
        // Son Compte est deja Activer
        handleEmployerLoginSuccess();
      }else{
        UpdatePasswordArgs args = UpdatePasswordArgs(token,_password);
        Navigator.pushReplacementNamed(context,UpdatePasswordScreen.ROUTE,arguments: args);

      }

    }else if(token.isAgentStock()){

    }

  }

  void handleAgentLoginSuccess() {
    Navigator.pushNamed(context, WorkerDashboardScreen.ROUTE);
    MainNavigatorKey.key.currentState.pushReplacementNamed(WorkerDashboardScreen.ROUTE);
    return;
  }

  void handleEmployerLoginSuccess() {
  //  MainNavigatorKey.key.currentState.pushReplacementNamed(PatronDashboardScreen.ROUTE);
    Navigator.pushReplacementNamed(context,PatronDashboardScreen.ROUTE);
    return;
  }

  void handleUnpublishedJob() {
   // Job job = jobProvider.unpublishedCachedJob.job;
  //  job.images = jobProvider.unpublishedCachedJob.images ?? [];

  }






}
