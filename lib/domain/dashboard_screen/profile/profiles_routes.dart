import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/profile/new_plainte_screen.dart';
import 'package:myflutter/domain/dashboard_screen/profile/profile_screen.dart';

import '../bottom_navigation.dart';

class ProfileRoute extends StatelessWidget{

  ProfileRoute({Key key, this.navigatorKey, this.selectTab, }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){

        switch (settings.name){
          case ProfileScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> ProfileScreen(),
                settings: settings
            );
            break;

          case NewPlainteScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context)=>NewPlainteScreen(),
              settings: settings
            );
            break;

          default:
            throw Exception("Invalid route");
        }
      },
    );
  }



}
