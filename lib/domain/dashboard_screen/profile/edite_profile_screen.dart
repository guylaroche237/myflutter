import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:myflutter/domain/dashboard_screen/profile/update_args.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/provider/auth_provider.dart';
import 'package:myflutter/domain/widget/button/primary_button.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/update_user_request.dart';
import 'package:myflutter/model/user.dart';
import 'package:provider/provider.dart';

class EditeProfileScreen extends StatefulWidget{
  final User user;
  static const ROUTE = "/edite/profil";
  const EditeProfileScreen({Key key, this.user}) : super(key: key);

  _EditeProfileScreenState createState() => _EditeProfileScreenState();

}

class _EditeProfileScreenState extends State<EditeProfileScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inAsyncall = false;
  String nom,prenom,email;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // TODO: implement build
    return ModalProgressHUD(
      inAsyncCall: inAsyncall,
      child: Scaffold(
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
                            setState(() {
                              nom = value;
                            });

                          },
                          validator: (value) {
                            if (!Validator.isNotEmpty(value)) {
                              return "entrer votre nom";
                            }
                            return null;
                          }),
                      SizedBox(height: 4,),
                      Divider(height: 1,),
                      BlackOutlineTextField(
                          hintText: "Prenom",
                          initialValue: widget.user.prenom??"",
                          onChanged: (value) {
                            setState(() {
                              prenom = value;
                            });

                          },
                          validator: (value) {
                            if (!Validator.isNotEmpty(value)) {
                              return "entrer votre prenom";
                            }
                            return null;
                          }),
                      SizedBox(height: 4,),
                      Divider(height: 1,),
                      BlackOutlineTextField(
                          hintText: "votre email",
                          initialValue: widget.user.email??"",
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });

                          },
                          validator: (value) {
                            if (!Validator.isEmail(value)) {
                              return "entrer un mail valide";
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
                                  UpdateAgrs args = UpdateAgrs(email: email,prenom: prenom,nom: nom);
                                  updateProfil(args, authProvider);

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

  Future<void> updateProfil(UpdateAgrs agrs,AuthProvider authProvider) async {
    setState(() {
      inAsyncall = true;
    });
   AbstractApiResponse response = await authProvider.updateUser(authProvider.token,authProvider.user, agrs);
    UpdateUserRequest updateUserRequest = UpdateUserRequest(token: authProvider.token,user: authProvider.user,agrs: agrs);
   // updateUserRequest.parseResult(
       // await ApiClient.execAndParseOrFail(updateUserRequest);
  //  );
    setState(() {
      inAsyncall = false;
    });
    BotToast.showSimpleNotification(title: "Mise a jour effectue avec success ",duration: Duration(seconds: 30));
    Navigator.pop(context);


  }

}