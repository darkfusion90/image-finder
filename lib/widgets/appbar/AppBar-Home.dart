import 'package:flutter/material.dart';

import 'package:searchimages/widgets/appbar/BaseAppBar.dart';

class AppBarHome extends BaseAppBar {
  final VoidCallback onSearchButtonPressed;
  final PreferredSizeWidget bottom;

  AppBarHome({@required this.onSearchButtonPressed, this.bottom})
      : super(bottom: bottom);

  @override
  State<StatefulWidget> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Image Finder'),
      actions: _buildAppBarActions(),
      bottom: widget.bottom,
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: widget.onSearchButtonPressed,
      )
    ];
  }
}
