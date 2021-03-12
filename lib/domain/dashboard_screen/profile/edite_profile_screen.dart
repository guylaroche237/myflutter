import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/model/user.dart';

class EditeProfileScreen extends StatefulWidget{
  final User user;
  static const ROUTE = "/edite/profil";
  const EditeProfileScreen({Key key, this.user}) : super(key: key);

  _EditeProfileScreenState createState() => _EditeProfileScreenState();

}

class _EditeProfileScreenState extends State<EditeProfileScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  dahshboardAppBar(context, title: "Edite Profile"),
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
                        initialValue: widget.user.nom??"",
                        onChanged: (value) {

                        },
                        validator: (value) {
                          if (!Validator.isNotEmpty(value)) {
                            return "Please enter a house description";
                          }
                          return null;
                        }),
                    SizedBox(height: 4,),
                    Divider(height: 1,),
                    BlackOutlineTextField(
                        hintText: "Prenom",
                        initialValue: widget.user.prenom,
                        onChanged: (value) {

                        },
                        validator: (value) {
                          if (!Validator.isNotEmpty(value)) {
                            return "Please enter a house description";
                          }
                          return null;
                        }),
                    SizedBox(height: 4,),
                    Divider(height: 1,),
                    BlackOutlineTextField(
                        hintText: "Nom Du Point",
                        initialValue: "",
                        onChanged: (value) {

                        },
                        validator: (value) {
                          if (!Validator.isNotEmpty(value)) {
                            return "Please enter a house description";
                          }
                          return null;
                        }),
                    SizedBox(height: 4,),
                    Divider(height: 1,),
                    BlackOutlineTextField(
                        hintText: "Quartier",
                        initialValue: "",
                        onChanged: (value) {

                        },
                        validator: (value) {
                          if (!Validator.isNotEmpty(value)) {
                            return "Please enter a house description";
                          }
                          return null;
                        }),
                    SizedBox(height: 8,),

                    Divider(height: 1,),

                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrimaryButton(
                              text: "Enregistrer",
                              onPressed: () {

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
    );
  }

}