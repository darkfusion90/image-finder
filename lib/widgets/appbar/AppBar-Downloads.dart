import 'package:flutter/material.dart';
import 'package:searchimages/widgets/appbar/BaseAppBar.dart';

class AppBarDownloads extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _AppBarDownloadsState();
}

class _AppBarDownloadsState extends State<AppBarDownloads> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Image Finder - Downloads'));
  }
}
