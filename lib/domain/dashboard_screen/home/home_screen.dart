
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/benefices/benefice_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/add_commande_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/all_commandes_screen.dart';
import 'package:myflutter/domain/dashboard_screen/commande/commande_livrer_detail.dart';
import 'package:myflutter/domain/dashboard_screen/perte/perte_screen.dart';
import 'package:myflutter/domain/dashboard_screen/ristourne/all_ristournes_screens.dart';
import 'package:myflutter/domain/dashboard_screen/ristourne/ancien_ristourne_screen.dart';
import 'package:myflutter/domain/dashboard_screen/vente/add_vente_screen.dart';
import 'package:myflutter/domain/screen/filtre/etat_screen.dart';

import '../bottom_navigation.dart';
import 'home_detail_screen.dart';
import 'home_worker_screen.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen({Key key, this.navigatorKey, this.selectTab, @required this.role}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;
  final int role;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: (role == 0)?HomeDetailScreen.ROUTE:HomeWorkerDetailScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){

        switch (settings.name){
          case HomeDetailScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> HomeDetailScreen(),
                settings: settings
            );
            break;
          case AddCommandeScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context)=> AddCommandeScreen(),
              settings: settings
            );
            break;
          case AllCommandeScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context)=> AllCommandeScreen(),
              settings: settings
            );
            break;
          case HomeWorkerDetailScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => HomeWorkerDetailScreen(),
              settings: settings
            );

          case AddVenteScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context) => AddVenteScreen(),
                settings: settings
            );
            break;

          case AllRistourneScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context) => AllRistourneScreen(),
                settings: settings
            );
            break;
          case FilterEtatScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => FilterEtatScreen(),
              settings: settings
            );
            break;

          case AllBeneficeScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => AllBeneficeScreen(),
              settings: settings
            );
            break;

          case AncientourneScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => AncientourneScreen(),
              settings: settings
            );
            break;

          case CommandeLivrerDetailScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => CommandeLivrerDetailScreen(
                args: settings.arguments,
              ),
              settings: settings
            );

          case PerteScreen.ROUTE:
            return MaterialPageRoute(
              builder: (context) => PerteScreen(),
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

