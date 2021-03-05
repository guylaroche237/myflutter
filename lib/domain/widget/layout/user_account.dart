
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/layout/profile_preview.dart';
import 'package:myflutter/model/user.dart';

class UserAccount extends StatelessWidget {
  final User user;

  const UserAccount({Key key, this.user }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User Account", style: ThemeHelper.paragraph(color: Colors.black, isBold: true)),
        SizedBox(height: 8),
        Container(
            padding: EdgeInsets.only(left: 5,right: 10),
            child: ProfilePreview(user: user,)),

      ],
    );

  }
}