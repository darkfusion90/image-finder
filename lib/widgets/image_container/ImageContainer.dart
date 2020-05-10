import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/models/Image.dart' show ImageUrlTypes;
import 'ImageActions.dart' show ImageActions;

class ImageContainer extends StatelessWidget {
  final models.Image _image;

  ImageContainer(this._image);

  Widget _buildImageLoadingPlaceholder(BuildContext context, String url) {
    return Container(
      child: Text(_image.altDesc ?? ''),
      color: Colors.deepOrange,
      width: _image.getWidth(urlType: ImageUrlTypes.THUMB).toDouble(),
      height: _image.getHeight(urlType: ImageUrlTypes.THUMB).toDouble(),
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: _image.getUrl(ImageUrlTypes.THUMB),
      placeholder: _buildImageLoadingPlaceholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[_buildImage(), ImageActions(this._image)],
      ),
    );
  }
}
