import 'package:flutter/material.dart';
import 'package:searchimages/widgets/SearchBar.dart';
import 'package:searchimages/widgets/SearchResults.dart';

class HomePage extends StatelessWidget {
  void _onSearchBarInputChanged(String value) {
    print('You typed: ' + value);
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        SearchBar(this._onSearchBarInputChanged),
        SearchResults()
      ],
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
