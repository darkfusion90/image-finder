import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/models/Image.dart' show ImageUrlTypes;
import 'package:searchimages/widgets/ImageContainer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: GestureDetector(
        child: _buildContent(context),
        onTap: _hideDeviceStatusBar,
      ),
    );
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
