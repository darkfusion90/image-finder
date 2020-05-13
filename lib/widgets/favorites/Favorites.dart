import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchimages/widgets/appbar/AppBar-Favorites.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFavorites(),
      body: Center(child: Text('Favorites Page')),
    );
  }
}
