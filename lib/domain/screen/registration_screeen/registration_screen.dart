import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/screen/login_screen/login_screen.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_password_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_text_field.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';

import '../continu_as_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key,}) : super(key: key);
 // final Role role;
  static const ROUTE = "/register";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
 // Role _selectedRole;
  bool _termsAccepted;
  bool _inAsyncCall = false;

  @override
  void initState() {
    super.initState();
    _termsAccepted = false;
    _email = "";
  //  _selectedRole = widget.role;
    _password = "";

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);

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
                                              /**  Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        FacebookButton(
                                                          onPressed: () {
                                                            _showTermAndServicesDialog(
                                                                AuthentificationProviders
                                                                    .FACEBOOK,
                                                                authProvider);
                                                          },
                                                          text:
                                                          "Register with facebook",
                                                        ),
                                                        SizedBox(width: 8),
                                                        GoogleButton(
                                                          onPressed: () {
                                                            _showTermAndServicesDialog(
                                                                AuthentificationProviders
                                                                    .GOOGLE,
                                                                authProvider);
                                                          },
                                                          text: "Register with google",
                                                        )
                                                      ]),
                                                ),
                                                TextSeparator(text: "OR"),**/
                                                LightTextField(
                                                  validator: (value) {
                                                    if (!(Validator.isEmail(value) &&
                                                        Validator.isNotEmpty(value))) {
                                                      return "The value entered is not valid";
                                                    }
                                                    return null;
                                                  },
                                                  hintText: "Your email",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _email = value.trim();
                                                    });
                                                  },
                                                ),
                                                LightPasswordTextField(
                                                  hintText: "Your password",
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _password = value;
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
                                                LightPasswordTextField(
                                                  hintText: "Enter password again",
                                                  onChanged: (value) {},
                                                  validator: (value) {
                                                    if (value != _password) {
                                                      return "The password doesn't match";
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
                                                      _attemptRegistration();
                                                    },
                                                    text: "Sign up"),
                                                InkWell(
                                                  onTap: () {
                                                          Navigator.pushNamed(context, LoginScreen.ROUTE,);
                                                  },
                                                  child: Text("Login instead",
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

    if (!_termsAccepted) {
      BotToast.showSimpleNotification(
          title: "You must agree with terms and conditions");
      return false;
    }
    return true;
  }

  void _attemptRegistration() async {
    if (!_validate()) {
      return;
    }

  }

  void onRegistrationSuceed({String message}) {

  }

  void _socialRegistration() async {


  }

  void _onRegistrationFailed(err) {

  }
}
