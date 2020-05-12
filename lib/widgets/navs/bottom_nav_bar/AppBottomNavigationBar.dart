import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BaseBottomNavItem.dart';
import 'BottomNavItem-Home.dart';
import 'BottomNavItem-Favorites.dart';
import 'BottomNavItem-Downloads.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final List<BaseBottomNavItem> _navItems = [
    BottomNavItemHome(),
    BottomNavItemFavorites(),
    BottomNavItemDownloads()
  ];

  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buildNavItems(),
      currentIndex: _currentNavIndex,
      onTap: _handleOnTap,
    );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return _navItems.map((navItem) => navItem.buildItem()).toList();
  }

  void _handleOnTap(int tappedNavItemIndex) {
    _setCurrentNavIndex(tappedNavItemIndex);

    BaseBottomNavItem tappedItem = _navItems[tappedNavItemIndex];
    tappedItem.handleOnItemTap();
  }

  void _setCurrentNavIndex(int updatedIndex) {
    setState(() {
      _currentNavIndex = updatedIndex;
    });
  }
}
