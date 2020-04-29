import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  final List<String> _searchResults = new List<String>();

  Widget _buildRow(context, index) {
    return ListTile(title: Text(_searchResults[index]));
  }

  Widget _buildEmptySearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text('No results :(', style: TextStyle(fontSize: 26))],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_searchResults.isEmpty) {
      return _buildEmptySearchResults();
    }

    return ListView.builder(itemBuilder: _buildRow);
  }
}
