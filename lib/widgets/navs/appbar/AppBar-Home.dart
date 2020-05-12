import 'package:flutter/material.dart';
import 'package:searchimages/widgets/navs/appbar/BaseAppBar.dart';

class AppBarHome extends BaseAppBar {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Image Finder - Home'));
  }
}
