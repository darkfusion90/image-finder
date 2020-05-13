import 'package:flutter/material.dart';
import 'package:searchimages/utils/widget-based.dart';

import 'widgets/SearchResults.dart';
import 'package:searchimages/widgets/appbar/AppBar-Home.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _searchQuery;

  void _onSearchQuerySet(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  Widget _buildEmptySearchQueryResult() {
    return Container(
      child:
          Center(child: Text('Type something in the search bar to search for')),
    );
  }

  Widget _buildBody() {
    return Container(
      child: (_searchQuery ?? '').isEmpty
          ? _buildEmptySearchQueryResult()
          : SearchResults(this._searchQuery),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(onSearchQuerySet: _onSearchQuerySet),
      body: GestureDetector(
        child: _buildBody(),
        onTap: () => requestFocus(context),
      ),
    );
  }
}
