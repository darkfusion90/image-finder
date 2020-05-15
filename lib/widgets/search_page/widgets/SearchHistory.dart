import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:searchimages/database/controllers/searchQueries.dart'
    as searchQueries;
import 'package:searchimages/database/models/SearchQuery.dart';

class SearchHistory extends StatefulWidget {
  final String filterUsingSearchQuery;

  SearchHistory({this.filterUsingSearchQuery});

  @override
  State<StatefulWidget> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final List<SearchQuery> _searchHistory = new List<SearchQuery>();

  @override
  void initState() {
    super.initState();
    _fetchSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _searchHistory.length, itemBuilder: _buildSearchHistoryRow);
  }

  Widget _buildSearchHistoryRow(BuildContext builderContext, int index) {
    final SearchQuery searchQuery = _searchHistory[index];
    return ListTile(
      title: Text(searchQuery.query),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: () => this._deleteSearchQuery(searchQuery),
      ),
    );
  }

  void _deleteSearchQuery(SearchQuery searchQuery) {
    searchQueries.deleteSearchQuery(searchQuery.query);
  }

  void _fetchSearchHistory() async {
    List<SearchQuery> searchQueryList =
        await searchQueries.getAllSearchQueries();

    if (this.mounted) {
      setState(() {
        _searchHistory.addAll(searchQueryList);
      });
    }
  }
}
