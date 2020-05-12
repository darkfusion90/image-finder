import 'package:flutter/material.dart';
import 'BaseBottomNavItem.dart';

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
