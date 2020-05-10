import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/utils/api.dart' as api;
import 'image_container/ImageContainer.dart' show ImageContainer;

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
    print('Future: $_futureImageList');
    return FutureBuilder<List<models.Image>>(
        future: _futureImageList,
        builder: (context, snapshot) {
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

  Widget _buildAdditionalImageLoader() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
      padding: EdgeInsets.all(16.0),
    );
  }

  Widget _buildInitialState() {
    return Container(
      child: Center(child: Text('Type something in the search bar')),
      padding: EdgeInsets.all(16.0),
    );
  }

  Widget _buildData(data) {
    if (_isSearchQueryEmpty()) {
      return _buildInitialState();
    }

    if (data.isEmpty) {
      return _buildEmptySearchResults();
    }

    final int itemCountWithExtraForSpinner = data.length + 1;
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: itemCountWithExtraForSpinner,
      itemBuilder: (context, index) {
        return index == data.length
            ? _buildAdditionalImageLoader()
            : ImageContainer(data[index]);
      },
      staggeredTileBuilder: (index) =>
          new StaggeredTile.fit(index == data.length ? 2 : 1),
    );
  }

  bool _isSearchQueryEmpty() {
    return (widget.searchQuery ?? '').trim().isEmpty;
  }
}
