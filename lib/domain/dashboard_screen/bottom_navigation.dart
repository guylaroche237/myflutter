
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';


enum TabItem { home, cmd, stock, vente, profile }
List<TabItem> workerTabItems = [
  TabItem.home,
  TabItem.cmd,
  TabItem.stock,
  TabItem.vente
];
List<TabItem> employerTabItems = [
  TabItem.home,
  TabItem.cmd,
  TabItem.vente,
  TabItem.stock,
  TabItem.profile
];
Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.stock: 'Stock',
  TabItem.cmd: 'Livraison',
  TabItem.vente: 'Vente',
  TabItem.profile: 'My Profile'
};

Map<TabItem, IconData> tabIcon = {

  TabItem.cmd: Icons.add_shopping_cart,
  TabItem.home: Icons.home,
  TabItem.stock: Icons.folder,
  TabItem.vente: Icons.monetization_on,
  TabItem.profile: Icons.account_circle
};

class BottomNavigation extends StatelessWidget {
  final int role;
  BottomNavigation({this.currentTab, this.onSelectTab, @required this.role});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 2)]),
      child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 32,
          selectedItemColor: ThemeHelper.SECONDARY_COLOR,
          unselectedItemColor: ThemeHelper.SUCCES_COLOR,
          type: BottomNavigationBarType.shifting,
          items: _buildBottomNavigationItemsFromRole(),
          onTap: (index) {
            onSelectTab(
              currentTabItemList[index],
            );
          }),
    );
  }

  List<TabItem> get currentTabItemList {
    if (role == 0) {
      return employerTabItems;
    }
    return workerTabItems;
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItemsFromRole() {
    return List<BottomNavigationBarItem>.from(
        currentTabItemList.map((v) => (_buildItem(tabItem: v))));
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item
        ? ThemeHelper.PRIMARY_COLOR
        : ThemeHelper.BLACL_COLOR;
  }
}
