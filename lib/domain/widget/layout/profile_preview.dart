import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/profile_picture.dart';
import 'package:myflutter/model/user.dart';

class ProfilePreview extends StatefulWidget{
  final User user;

  const ProfilePreview({Key key, this.user}) : super(key: key);
  _ProfilePreviewState createState()=> _ProfilePreviewState();
  
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex:1,child: ProfilePicture(user: widget.user,)),
                Flexible(flex:2,child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(text: widget.user.nom+" "+widget.user.prenom, style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
                        ])),
                    Text(widget.user.email),
                    Text(widget.user.telephone)

                  ],
                ))

              ],
            ),),
      ),
    );
  }

}