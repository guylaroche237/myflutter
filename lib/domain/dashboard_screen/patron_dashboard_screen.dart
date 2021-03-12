
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/profile/profile_screen.dart';
import 'package:myflutter/domain/dashboard_screen/profile/profiles_routes.dart';
import 'package:myflutter/domain/dashboard_screen/stock/stock_screen.dart';
import 'package:myflutter/domain/dashboard_screen/stock/stocks_routes.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_routes.dart';
import 'package:myflutter/domain/screen/login_screen/login_screen.dart';
import 'package:myflutter/model/livraison.dart';
import 'bottom_navigation.dart';
import 'home/home_screen.dart';
import 'livraison/livraison_route.dart';

class PatronDashboardScreen extends StatefulWidget {
  static const ROUTE = "/patron-dashboard";
  PatronDashboardScreen({Key key}) : super(key: key);

  @override
  _PatronDashboardScreenState createState() => _PatronDashboardScreenState();
}

class _PatronDashboardScreenState extends State<PatronDashboardScreen> {
  //TabItem _currentTab = TabItem.jobs;
  TabItem _currentTab = TabItem.home;
  @override
  Widget build(BuildContext context) {
    Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
      TabItem.cmd: GlobalKey<NavigatorState>(),
      TabItem.home: GlobalKey<NavigatorState>(),
      TabItem.stock: GlobalKey<NavigatorState>(),
      TabItem.profile: GlobalKey<NavigatorState>(),
      TabItem.vente: GlobalKey<NavigatorState>(),
    };
    List<TabItem> _hasRoute = [
      TabItem.home,
      TabItem.profile,
      TabItem.cmd,
      TabItem.stock,
      TabItem.home,
      TabItem.vente
    ];
    void _selectTab(TabItem tabItem) {
      if (tabItem == _currentTab) {
        _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
      } else {
        setState(() => _currentTab = tabItem);
      }
    }

    Map<TabItem, Widget> _buildMap = {
      TabItem.home : HomeScreen(
        navigatorKey: _navigatorKeys[TabItem.home],
        selectTab: _selectTab,
        role: 0,
      ),
      TabItem.stock: StockRoute(
        navigatorKey: _navigatorKeys[TabItem.stock],

      ),
      TabItem.cmd: LivraisonRoute(
          navigatorKey: _navigatorKeys[TabItem.cmd]
      ),
      TabItem.profile: ProfileRoute(
        navigatorKey: _navigatorKeys[TabItem.profile],
      ),

      TabItem.vente: VenteRoute(
        navigatorKey: _navigatorKeys[TabItem.vente],
      ),
    };

    Widget _buildOffstageNavigator(TabItem tabItem) {
      return Offstage(
          offstage: _currentTab != tabItem,
          child: _hasRoute.contains(tabItem)
              ? _buildMap[tabItem]
              : Navigator(
              key: _navigatorKeys[tabItem],
              initialRoute: LoginScreen.ROUTE,
              onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (context) => _buildMap[tabItem])));
    }

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: SafeArea(
        child: new Scaffold(
            body: _buildOffstageNavigator(_currentTab),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigation(
              role: 0,
              currentTab: _currentTab,
              onSelectTab: _selectTab,
            )),
      ),
    );
  }
}
