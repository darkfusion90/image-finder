import 'package:flutter/material.dart';
import 'BaseBottomNavItem.dart';

class BottomNavItemFavorites extends BaseBottomNavItem {
  @override
  BottomNavigationBarItem buildItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Favorites'),
    );
  }

  @override
  void handleOnItemTap() {
    print('Item Favorites Tapped');
  }
}
