
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/inventaire/add_inventaire_screen.dart';
import 'package:myflutter/domain/dashboard_screen/inventaire/detail_inventaire_screen.dart';
import 'package:myflutter/domain/dashboard_screen/ristourne/all_ristournes_screens.dart';
import 'package:myflutter/domain/screen/splash_screen.dart';


import 'continue_as_screen.dart';
import 'dashboard_screen/benefices/benefice_screen.dart';
import 'dashboard_screen/commande/add_commande_screen.dart';
import 'dashboard_screen/commande/all_commandes_screen.dart';
import 'dashboard_screen/commande/commande_livrer_detail.dart';
import 'dashboard_screen/inventaire/all_inventaire_screen.dart';
import 'dashboard_screen/patron_dashboard_screen.dart';
import 'dashboard_screen/worker_dashboard_screen.dart';
import 'screen/login_screen/login_screen.dart';
import 'screen/onboarding_screen.dart';
import 'screen/registration_screeen/registration_screen.dart';
import 'screen/select_role_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case OnboardingScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case ContinueAsScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => ContinueAsScreen());
      case LoginScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => LoginScreen(args: settings.arguments,));
      case RegistrationScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case WorkerDashboardScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => WorkerDashboardScreen());
      case SelectRoleScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => SelectRoleScreen());
      case PatronDashboardScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => PatronDashboardScreen());
      case AddCommandeScreen.ROUTE:
        return MaterialPageRoute(
            builder: (context)=> AddCommandeScreen(),
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
      case AllRistourneScreen.ROUTE:
        return MaterialPageRoute(
          builder: (context) => AllRistourneScreen(),
          settings: settings
        );
        break;
      case AddInventaireScreen.ROUTE:
        return MaterialPageRoute(
          builder: (context)=> AddInventaireScreen(),
          settings: settings
        );
        break;

      case AllBeneficeScreen.ROUTE:
        return MaterialPageRoute(
            builder: (context) => AllBeneficeScreen(),
            settings: settings
        );
        break;

      case DetailInventaireScreen.ROUTE:
        return MaterialPageRoute(
          builder: (context) => DetailInventaireScreen(
            inventaire: settings.arguments,
          ),
          settings: settings
        );
        break;

      case AllInventaireScreen.ROUTE:
        return MaterialPageRoute(
            builder: (context)=> AllInventaireScreen(),
            settings: settings
        );
        break;

      case AllCommandeScreen.ROUTE:
        return MaterialPageRoute(
            builder: (context)=> AllCommandeScreen(),
            settings: settings
        );
      default:
        throw 'Route not found';
    }
  }
}

class MainNavigatorKey {
  static GlobalKey<NavigatorState> _navigatorKey;
  static GlobalKey<NavigatorState> get key {
    if (_navigatorKey == null) {
      _navigatorKey = GlobalKey<NavigatorState>();
    }
    return _navigatorKey;
  }
}