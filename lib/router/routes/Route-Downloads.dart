import 'package:flutter/material.dart';
import 'package:searchimages/widgets/downloads/Downloads.dart';

class RouteDownloads {
  static MaterialPageRoute<dynamic> getRoute() {
    return MaterialPageRoute(builder: (_) => DownloadsPage());
  }
}
