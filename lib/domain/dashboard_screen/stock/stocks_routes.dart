
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/stock/detail_stock_screen.dart';
import 'package:myflutter/domain/dashboard_screen/stock/stock_screen.dart';

import '../bottom_navigation.dart';

class StockRoute extends StatelessWidget{

  StockRoute({Key key, this.navigatorKey, this.selectTab}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: StockScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){

        switch (settings.name){
          case StockScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> StockScreen(),
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

