import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchimages/widgets/appbar/AppBar-Downloads.dart';

class DownloadsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDownloads(),
      body: Center(child: Text('Downloads Page')),
    );
  }
}
