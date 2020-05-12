import 'package:flutter/material.dart';
import 'package:searchimages/widgets/bottomNavBar/BaseBottomNavItem.dart';

class BottomNavItemHome extends BaseBottomNavItem {
  @override
  BottomNavigationBarItem buildItem() {
    return BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'));
  }

  @override
  void handleOnItemTap() {
    print('Item Home Tapped');
  }
}
