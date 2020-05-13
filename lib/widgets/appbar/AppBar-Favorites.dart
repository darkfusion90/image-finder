import 'package:flutter/material.dart';
import 'package:searchimages/widgets/appbar/BaseAppBar.dart';

class AppBarFavorites extends BaseAppBar {
  @override
  State<StatefulWidget> createState() => _AppBarFavoritesState();
}

class _AppBarFavoritesState extends State<AppBarFavorites> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Image Finder - Favorites'));
  }
}