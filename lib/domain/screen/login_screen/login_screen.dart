import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/patron_dashboard_screen.dart';
import 'package:myflutter/domain/dashboard_screen/worker_dashboard_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_password_text_field.dart';
import 'package:myflutter/domain/widget/form/text_fields/light_text_field.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';

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
  String _email;
  String _password;
  bool _inAsyncCall = false;
  bool no_forget_me ;
  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    super.initState();
   // _selectedRole = widget.args.role;
  //  AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
  //  _email = authProvider.getEmail();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);

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
                                      Flexible(
                                        flex: 2,
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
                                            /**    Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        FacebookButton(
                                                          onPressed: () {
                                                            _loginWithFacebook(authProvider,
                                                                jobProvider,
                                                                messageProvider);
                                                          },
                                                          text: "Login with facebook",

                                                        ),
                                                        SizedBox(width: 8),
                                                        GoogleButton(
                                                          onPressed: () {
                                                            _loginWithGoogle(
                                                                authProvider,
                                                                jobProvider,
                                                                messageProvider);
                                                          },
                                                          text: "Login with google ",
                                                        )
                                                      ]),
                                                ),
                                                TextSeparator(
                                                  text: "OR",
                                                ),**/

                                                LightTextField(
                                                  keyboardType:
                                                  TextInputType.emailAddress,
                                                  //initialValue: authProvider.getEmail(),
                                                  hintText: "Your email",
                                                  onChanged: (value) {
                                                    String v = value;
                                                    setState(() {
                                                      _email = v.trim();
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (!(Validator.isEmail(value) &&
                                                        Validator.isNotEmpty(value))) {
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
                                                     _attemptLogin(_email,_password);

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

  void _attemptLogin(String email,String password) async {
    if(email == 'admin@gmail.com' && password == 'admin'){
      onLoginSucess();
    }

  }

  void onLoginSucess() {
    if(widget.args.role == 0){
      print('------------------ role employer -------------'+widget.args.role.toString());
     handleEmployerLoginSuccess();
    }else{
      print('------------------ role worker -------------'+widget.args.role.toString());
      handleWorkerLoginSuccess();
    }

  }

  void handleWorkerLoginSuccess() {
    MainNavigatorKey.key.currentState
        .pushReplacementNamed(WorkerDashboardScreen.ROUTE);
    return;
  }

  void handleEmployerLoginSuccess() {
    MainNavigatorKey.key.currentState.pushReplacementNamed(PatronDashboardScreen.ROUTE);
    return;
  }

  void handleUnpublishedJob() {
   // Job job = jobProvider.unpublishedCachedJob.job;
  //  job.images = jobProvider.unpublishedCachedJob.images ?? [];

  }




}
