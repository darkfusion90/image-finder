import 'package:flutter/material.dart';

import 'package:searchimages/utils/widget-based.dart';
import 'package:searchimages/widgets/appbar/BaseAppBar.dart';

class AppBarHome extends BaseAppBar {
  final ValueChanged<String> onSearchQuerySet;

  AppBarHome({@required this.onSearchQuerySet});

  @override
  State<StatefulWidget> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  final _searchQueryFieldController = TextEditingController();
  bool _isSearchState = false;

  void _toggleSearchState() {
    setState(() {
      _isSearchState = !_isSearchState;
    });
  }

  void _handleOnSearchButtonPressed() {
    if (_isSearchState) {
      _removeFocusFromSearchField();
      return widget.onSearchQuerySet(_searchQueryFieldController.text);
    }

    _toggleSearchState();
  }

  void _removeFocusFromSearchField() {
    requestFocus(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _buildLeading(),
      title: _buildTitle(),
      titleSpacing: _isSearchState ? 0 : NavigationToolbar.kMiddleSpacing,
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildTitle() {
    return _isSearchState ? _buildSearchField() : Text('Image Finder');
  }

  Widget _buildLeading() {
    final Widget backIconButton = IconButton(
      icon: Icon(Icons.keyboard_arrow_left),
      onPressed: _toggleSearchState,
    );

    return _isSearchState ? backIconButton : null;
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: _handleOnSearchButtonPressed,
      )
    ];
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryFieldController,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSearchQuerySet,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
      ),
    );
  }
}
