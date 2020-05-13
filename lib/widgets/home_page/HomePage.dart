import 'package:flutter/material.dart';
import 'package:searchimages/utils/widget-based.dart';

import 'widgets/SearchResults.dart';
import 'package:searchimages/widgets/appbar/AppBar-Home.dart';
import 'package:searchimages/models/main.dart' as models;
import 'package:searchimages/utils/api.dart' as api;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _searchQuery;
  bool _isLoadingData = false;
  int _pageNumber = 1;
  List<models.Image> _imageList = new List<models.Image>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(
        onSearchButtonPressed: _handleOnSearchButtonPressed,
      ),
      body: GestureDetector(
        child: _buildBody(),
        onTap: () => requestFocus(context),
      ),
    );
  }

  Widget _buildEmptySearchQueryResult() {
    return Container(
      child:
          Center(child: Text('Type something in the search bar to search for')),
    );
  }

  Widget _buildBody() {
    return Container(
      child: _isSearchQueryEmpty()
          ? _buildEmptySearchQueryResult()
          : SearchResults(
              imageList: _imageList,
              isLoadingData: _isLoadingData,
              onFetchMoreDataRequested: _fetchData,
            ),
    );
  }

  void _handleOnSearchButtonPressed(String searchQuery) {
    setState(() {
      _searchQuery = searchQuery;
    });

    if (!_isSearchQueryEmpty()) {
      _fetchData(shouldFetchFreshData: true);
    }
  }

  void _fetchData({bool shouldFetchFreshData = false}) async {
    _setStateBeforeLoading(shouldFetchFreshData);

    List newData = await api.fetchImages(_searchQuery, _pageNumber);

    _setStateAfterLoading(newData);
  }

  void _setStateBeforeLoading(bool shouldClearPrevResults) {
    if (!this.mounted) return;

    setState(() {
      if (shouldClearPrevResults) {
        _imageList.clear();
      }
      _isLoadingData = true;
      _pageNumber += 1;
    });
  }

  void _setStateAfterLoading(List<models.Image> data) {
    if (!this.mounted) return;

    setState(() {
      _imageList.addAll(data);
      _isLoadingData = false;
    });
  }

  bool _isSearchQueryEmpty() {
    return (_searchQuery ?? '').isEmpty;
  }
}
