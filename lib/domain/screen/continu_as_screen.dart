
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/screen/select_role_screen.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';


import 'login_screen/login_screen.dart';
import 'login_screen/login_screen_args.dart';
import 'registration_screeen/registration_screen.dart';

class ContinueAsScreen extends StatelessWidget {
  static const ROUTE = "continue-as";
  //final Function(Role) onRoleSelected;

  const ContinueAsScreen({Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: ContainerWithBackground(
              backgroundUrl: "assets/images/acceuil.jpg",
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get in and",
                          textAlign: TextAlign.center, style: ThemeHelper.heading2()),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        child: SecondaryButton(
                            onPressed: () {
                           //   Navigator.of(context).pushReplacementNamed(RegistrationScreen.ROUTE);
                            },
                            text: "Registration"),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        child: PrimaryButton(
                          onPressed: () {

                           // LoginScreenArgs loginargs = LoginScreenArgs(role:1);
                          //  Navigator.of(context).pushReplacementNamed(SelectRoleScreen.ROUTE);
                          },
                          text: "Login",
                        ),
                      )
                    ]),
              ),
            )));
  }

}
