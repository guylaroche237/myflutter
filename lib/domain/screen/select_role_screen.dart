
import 'package:flutter/material.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/layout/container_with_background.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/login_screen_args.dart';

class SelectRoleScreen extends StatelessWidget {
  static const ROUTE = "select-role";
  //final Function(Role) onRoleSelected;

  const SelectRoleScreen({Key key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: ContainerWithBackground(
              backgroundUrl: "assets/images/background.jpg",
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Select Role",
                          textAlign: TextAlign.start, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width*0.7,
                              child: SecondaryButton(
                                  onPressed: () {
                                    LoginScreenArgs loginargs = LoginScreenArgs(role:0);
                                    Navigator.of(context).pushReplacementNamed(LoginScreen.ROUTE,arguments: loginargs);

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.perm_identity,color: Colors.white,),
                                      Text("Manager User",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),),
                            ),
                            SizedBox(height: 8),
                            Divider(height: 10,color: Colors.black,),
                            Container(
                              padding: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width*0.7,
                              child: PrimaryButton(
                                onPressed: () {
                                  LoginScreenArgs loginargs = LoginScreenArgs(role:1);
                                  Navigator.of(context).pushReplacementNamed(LoginScreen.ROUTE,arguments: loginargs);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.group,color: Colors.white,),
                                    Text("Simple User",style: TextStyle(color: Colors.white),)
                                  ],
                                ),

                              ),
                            )

                          ],
                        ),
                      ),

                    ]),
              ),
            )));
  }

}
