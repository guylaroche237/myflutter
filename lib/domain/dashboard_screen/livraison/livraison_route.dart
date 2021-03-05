
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/livraison/livraison_detail.dart';
import 'package:myflutter/model/livraison.dart';

import '../bottom_navigation.dart';
import 'livraison_screen.dart';

class LivraisonRoute extends StatelessWidget{

  LivraisonRoute({Key key, this.navigatorKey, this.selectTab, }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: LivraisonScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case LivraisonScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> LivraisonScreen(),
                settings: settings
            );
            break;
          case DetailsLivraisonScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context)=> DetailsLivraisonScreen(
                args: settings.arguments,
              ),
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
