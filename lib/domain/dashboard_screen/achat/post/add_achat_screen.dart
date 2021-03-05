import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddAchatScreen extends StatefulWidget{

  static const ROUTE = "/add_achat";
  _AddAchatScreenState createState ()=> _AddAchatScreenState();

}

class _AddAchatScreenState extends State<AddAchatScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:  SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 32 - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text("creation d un achat"),
            )
          ),
        )
    );
  }

}