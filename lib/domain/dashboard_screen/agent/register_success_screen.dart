import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/agent/success_arg.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';

class RegisterSuccessScreen extends StatelessWidget{
  static const ROUTE = "/rgister/success";
  final SuccessArgs successArgs;

  const RegisterSuccessScreen({Key key, this.successArgs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child:
      Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("USERNAME:"),
              Text(successArgs.username,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Divider(height: 5,),
              Text("PASSWORD:"),
              Text(successArgs.password,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              Container(
                padding: EdgeInsets.all(25),
                child: PrimaryButton(
                  text: "Terminer",
                  onPressed: (){

                  },
                ),
              )
              
            ],
          ),
        ),
      )),
    );
  }

}