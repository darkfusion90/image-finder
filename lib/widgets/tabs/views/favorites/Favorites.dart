import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchimages/database/models/Favorite.dart';
import 'package:searchimages/database/controllers/favorites.dart'
    as favoritesDb;
import 'package:searchimages/widgets/generic/image_container/ImageContainer.dart';
import 'package:searchimages/utils/api.dart' as api;
import 'package:searchimages/widgets/search_page/widgets/search_results/image_grid_view/ImageGridView.dart';

class FavoritesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  Future<List<Favorite>> _favoriteListFuture;

  @override
  void initState() {
    super.initState();
    _favoriteListFuture = favoritesDb.getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _favoriteListFuture,
      builder: _futureFavoritesBuilder,
    );
  }

  Widget _futureFavoritesBuilder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      _buildFavorites(snapshot.data);
    } else if (snapshot.hasError) {
      _buildError();
    }

    return _buildLoader();
  }

  Widget _buildLoader() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildFavorites(List<Favorite> favorites) {
    return Text('YAY');
  }

  Widget _buildError() {
    return Text('Oops :(');
  }

  Future<void> _getFavoriteList() async {
    setState(() {
      _favoriteListFuture = favoritesDb.getAllFavorites();
    });
  }
}
