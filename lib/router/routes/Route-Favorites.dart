import 'package:flutter/material.dart';
import 'package:searchimages/widgets/favorites/Favorites.dart';

class RouteFavorites {
  static MaterialPageRoute<dynamic> getRoute() {
    return MaterialPageRoute(builder: (_) => FavoritesPage());
  }
}
