import 'package:flutter/material.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/utils/api.dart' as api;
import 'package:searchimages/widgets/ImageGridView.dart';

class SearchResults extends StatefulWidget {
  final String searchQuery;

  SearchResults(this.searchQuery);

  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  Future<List<models.Image>> _futureImageList;

  @override
  void initState() {
    if (!_isSearchQueryEmpty()) {
      _futureImageList = api.fetchImages(widget.searchQuery);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(SearchResults oldWidget) {
    super.didUpdateWidget(oldWidget);

    bool didQueryUpdate() {
      final String prevSearchQuery =
          oldWidget.searchQuery == null ? '' : oldWidget.searchQuery;
      final String currentSearchQuery =
          widget.searchQuery == null ? '' : widget.searchQuery;

      return currentSearchQuery.compareTo(prevSearchQuery) != 0;
    }

    if (didQueryUpdate() && !_isSearchQueryEmpty()) {
      setState(() {
        _futureImageList = api.fetchImages(widget.searchQuery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<models.Image>>(
        future: _futureImageList,
        builder: (context, snapshot) {
          if (_isSearchQueryEmpty()) {
            return _buildInitialState();
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return _buildLoader();
          }
          if (snapshot.hasData) {
            return _buildData(snapshot.data);
          }
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('${snapshot.error}'));
          }

          return _buildEmptySearchResults();
        });
  }

  Widget _buildData(List<models.Image> data) {
    return data.isEmpty ? _buildEmptySearchResults() : ImageGridView(data);
  }

  Widget _buildLoader() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptySearchResults() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.sentiment_dissatisfied,
            size: 64.0,
            color: Colors.grey,
          ),
          Text(
            'No results',
            style: TextStyle(fontSize: 32.0, color: Colors.grey),
          ),
        ]);
  }

  Widget _buildInitialState() {
    return Container(
      child: Center(child: Text('Type something in the search bar')),
      padding: EdgeInsets.all(16.0),
    );
  }

  bool _isSearchQueryEmpty() {
    return (widget.searchQuery ?? '').trim().isEmpty;
  }
}
