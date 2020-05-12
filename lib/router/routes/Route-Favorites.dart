import 'package:flutter/material.dart';

class RouteFavorites {
  static MaterialPageRoute<dynamic> getRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Container(
          child: Center(child: Text('FavoritesRoute')),
        );
      },
    );
  }
}
