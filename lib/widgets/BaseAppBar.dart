import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Widget title;
  final List<Widget> actions;

  BaseAppBar({Key key, this.title, this.actions})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: this.title, actions: this.actions);
  }
}
