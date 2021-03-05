
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/profile/new_plainte_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/model/boutique.dart';
import 'package:myflutter/model/user.dart';

class UserPlaintDetail extends StatelessWidget {
  final Boutique boutique;
  final User user;

  const UserPlaintDetail({Key key, this.boutique, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, NewPlainteScreen.ROUTE);
          },
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 15,right: 10,bottom: 5,top: 10),
                  child: Icon(Icons.border_color,color: Colors.green,)),
              Text("Nouvelle Plainte",),
            ],
          ),
        ),
      ],
    );

  }
}