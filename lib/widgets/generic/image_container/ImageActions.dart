import 'package:flutter/material.dart';
import 'package:searchimages/database/models/main.dart' as models;
import 'package:searchimages/database/controllers/favorites.dart' as favorites;

class ImageActions extends StatefulWidget {
  final models.ImageModel _image;

  ImageActions(this._image);

  @override
  State<StatefulWidget> createState() => _ImageActionsState();
}

class _ImageActionsState extends State<ImageActions> {
  bool _isAlreadyFavorite = false;

  @override
  void initState() {
    super.initState();
    _updateAlreadyFavorite();
  }

  @override
  void didUpdateWidget(ImageActions oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateAlreadyFavorite();
  }

  void _addToFavorites(models.ImageModel image) async {
    await favorites.createFavorite(image);
    _updateAlreadyFavorite();
  }

  void _removeFromFavorites(models.ImageModel image) async {
    await favorites.deleteFavorite(image);
    _updateAlreadyFavorite();
  }

  void _updateAlreadyFavorite() async {
    bool isFav = await favorites.isImageFavorite(widget._image);
    setState(() {
      _isAlreadyFavorite = isFav;
    });
  }

  Icon _getFavoriteIcon() {
    return Icon(
      this._isAlreadyFavorite ? Icons.favorite : Icons.favorite_border,
    );
  }

  List<Widget> _buildActions() {
    return [
      Tooltip(
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: _getFavoriteIcon(),
          onPressed: () => this._isAlreadyFavorite
              ? _removeFromFavorites(widget._image)
              : _addToFavorites(widget._image),
        ),
        message: 'Add To Favorites',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildActions(),
      ),
    );
  }
}
