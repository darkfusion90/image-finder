import 'package:flutter/material.dart';

abstract class BaseBottomNavItem {
  BottomNavigationBarItem buildItem();

  void handleOnItemTap();
}
