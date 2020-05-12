import 'package:flutter/material.dart';
import 'BaseBottomNavItem.dart';

class BottomNavItemDownloads extends BaseBottomNavItem {
  BottomNavigationBarItem buildItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.save_alt),
      title: Text('Downloads'),
    );
  }

  void handleOnItemTap() {
    print('on tap Downloads');
  }
}
