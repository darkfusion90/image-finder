import 'package:flutter/material.dart';

import 'package:searchimages/widgets/SearchBar.dart';
import 'package:searchimages/widgets/SearchResults.dart';

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

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar(this._onSearchFormSubmit),
          Expanded(child: SearchResults(this._searchQuery))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Finder - Home'),
      ),
      body: _buildBody(),
    );
  }
}
