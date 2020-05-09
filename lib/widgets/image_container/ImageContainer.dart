import 'package:flutter/material.dart';
import 'package:searchimages/models/main.dart' as models;
import 'ImageActions.dart' show ImageActions;

class ImageContainer extends StatelessWidget {
  final models.Image _image;

  ImageContainer(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image(image: NetworkImage(this._image.urls['thumb'])),
          ImageActions(this._image)
        ],
      ),
    );
  }
}
