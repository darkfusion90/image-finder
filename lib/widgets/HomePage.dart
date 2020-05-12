import 'package:flutter/material.dart';

import 'package:searchimages/widgets/SearchBar.dart';
import 'package:searchimages/widgets/SearchResults.dart';
import 'package:searchimages/widgets/BaseAppBar.dart';
import 'package:searchimages/widgets/bottomNavBar/AppBottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _searchQuery;

  void _onSearchFormSubmit(String value) {
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
      child: Column(
        children: <Widget>[
          SearchBar(this._onSearchFormSubmit),
          Expanded(
            child: (_searchQuery ?? '').isEmpty
                ? _buildEmptySearchQueryResult()
                : SearchResults(this._searchQuery),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Image Finder')),
      body: _buildBody(),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
