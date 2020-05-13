import 'package:flutter/material.dart';

import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/utils/api.dart' as api;
import 'package:searchimages/widgets/home_page/widgets/image_grid_view/ImageGridView.dart';

class SearchResults extends StatefulWidget {
  final String searchQuery;

  SearchResults(this.searchQuery);

  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  bool _isLoadingData = false;
  int _pageNumber = 1;
  List<models.Image> _imageList = new List<models.Image>();

  @override
  void initState() {
    if (!_isSearchQueryEmpty()) {
      _fetchData(isInitial: true);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(SearchResults oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_isSearchQueryEmpty()) {
      _fetchData(shouldFetchFreshData: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSearchQueryEmpty()) {
      return _buildInitialState();
    }

    if (_isLoadingData && _imageList.isEmpty) {
      return _buildLoader();
    }

    if (_imageList.isEmpty) {
      return _buildEmptySearchResults();
    }

    return ImageGridView(_imageList, _fetchData);
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

  void _fetchData({
    bool isInitial = false,
    bool shouldFetchFreshData = false,
  }) async {
    if (isInitial) {
      _isLoadingData = true;
    } else {
      _setStateBeforeLoading(shouldFetchFreshData || isInitial);
    }

    List<models.Image> newData =
        await api.fetchImages(widget.searchQuery, _pageNumber);

    if (this.mounted) {
      _setStateAfterLoading(newData);
    }
  }

  void _setStateAfterLoading(List<models.Image> data) {
    setState(() {
      _imageList.addAll(data);
      _isLoadingData = false;
    });
  }

  void _setStateBeforeLoading(bool shouldClearPrevResults) {
    setState(() {
      if (shouldClearPrevResults) {
        _imageList.clear();
      }
      _isLoadingData = true;
      _pageNumber += 1;
    });
  }
}