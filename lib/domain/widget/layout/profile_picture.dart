import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/model/user.dart';

class ProfilePicture extends StatelessWidget{
  final User user;

  const ProfilePicture({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green
      ),
      child: Icon(Icons.account_circle,color: Colors.white,),

    );
  }
}