import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/models/Image.dart' show ImageUrlTypes;
import 'package:searchimages/widgets/generic/image_container/ImageContainer.dart';
import 'package:searchimages/widgets/dialogs/image_download/ImageDownloadDialog.dart';

class ImageDetails extends StatelessWidget {
  final models.Image _image;

  ImageDetails(this._image);

  void _onDownloadButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) => ImageDownloadDialog(_image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: _buildAppBarActions(context),
      ),
      body: _buildContent(context),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.save_alt),
        onPressed: () => _onDownloadButtonPressed(context),
      )
    ];
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ImageContainer(
          _image,
          imageDisplaySize: ImageUrlTypes.SMALL,
        ),
      ),
    );
  }
}
