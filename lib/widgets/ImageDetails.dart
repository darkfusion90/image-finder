import 'package:flutter/cupertino.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/models/Image.dart' show ImageUrlTypes;
import 'package:searchimages/widgets/ImageContainer.dart';

class ImageDetails extends StatelessWidget {
  final models.Image _image;

  ImageDetails(this._image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ImageContainer(_image, imageDisplaySize: ImageUrlTypes.SMALL),
      onTap: () => Navigator.pop(context),
    );
  }
}
