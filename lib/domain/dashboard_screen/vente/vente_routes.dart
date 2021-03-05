
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/vente/add_vente_screen.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_detail_screen.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_screen.dart';


import '../bottom_navigation.dart';

class VenteRoute extends StatelessWidget{

  VenteRoute({Key key, this.navigatorKey, this.selectTab, }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: VenteScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){

        switch (settings.name){
          case VenteScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> VenteScreen(),
                settings: settings
            );
            break;
          case AddVenteScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => AddVenteScreen(),
              settings: settings
            );
            break;
          case VenteDetailScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => VenteDetailScreen(
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
