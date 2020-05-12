import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget title;
  final Color backgroundColor;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final ShapeBorder shape;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;

  BaseAppBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: this.actions,
      actionsIconTheme: this.actionsIconTheme,
      automaticallyImplyLeading: this.automaticallyImplyLeading,
      backgroundColor: this.backgroundColor,
      bottom: this.bottom,
      bottomOpacity: this.bottomOpacity,
      brightness: this.brightness,
      centerTitle: this.centerTitle,
      elevation: this.elevation,
      flexibleSpace: this.flexibleSpace,
      iconTheme: this.iconTheme,
      leading: this.leading,
      primary: this.primary,
      shape: this.shape,
      textTheme: this.textTheme,
      titleSpacing: this.titleSpacing,
      toolbarOpacity: this.toolbarOpacity,
      title: this.title,
    );
  }
}
