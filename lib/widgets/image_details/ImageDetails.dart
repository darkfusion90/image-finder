import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/models/Image.dart' show ImageUrlTypes;
import 'package:searchimages/widgets/generic/image_container/ImageContainer.dart';
import 'package:searchimages/widgets/dialogs/image_download/ImageDownloadDialog.dart';

class ImageDetails extends StatefulWidget {
  final models.Image _image;

  ImageDetails(this._image);

  @override
  State<StatefulWidget> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  void initState() {
    super.initState();
    _hideDeviceStatusBar();
  }

  @override
  void dispose() {
    _showDeviceStatusBar();
    super.dispose();
  }

  void _hideDeviceStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  void _showDeviceStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  void _onDownloadButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) => ImageDownloadDialog(widget._image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: _buildAppBarActions(context),
      ),
      body: GestureDetector(
        child: _buildContent(context),
        onTap: _hideDeviceStatusBar,
      ),
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
          widget._image,
          imageDisplaySize: ImageUrlTypes.SMALL,
        ),
      ),
    );
  }
}
