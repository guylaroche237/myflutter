import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


dahshboardAppBar(BuildContext context, {String title = ""}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(42.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              title,
              style: ThemeHelper.heading2(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ));
}