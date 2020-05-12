import 'package:flutter/material.dart';
import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/widgets/ImageDetails.dart';

class RouteImageDetails {
  static MaterialPageRoute<dynamic> getRoute(models.Image _image) {
    return MaterialPageRoute(builder: (_) => ImageDetails(_image));
  }
}
