import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:searchimages/database/models/main.dart' as models;
import 'package:searchimages/utils/typedefs.dart';
import 'package:searchimages/widgets/appbar/AppBar-SearchPage.dart';
import 'package:searchimages/widgets/search_page/widgets/search_results/SearchResults.dart';
import 'package:searchimages/widgets/search_page/utils/SearchPageMode.dart';
import 'package:searchimages/widgets/search_page/widgets/SearchHistory.dart';

class SearchPageView extends StatelessWidget {
  final List<models.ImageModel> imageList;
  final SearchPageMode searchPageMode;
  final bool isLoadingData;
  final FutureVoidCallback<bool> onWillPop;
  
  final ValueChanged<String> onSearchButtonPressed;
  final VoidCallback onSearchFieldFocused;
  final VoidCallback onFetchMoreDataRequested;
  
  SearchPageView({
    @required this.imageList,
    @required this.searchPageMode,
    @required this.isLoadingData,
    @required this.onWillPop,
    @required this.onSearchButtonPressed,
    @required this.onSearchFieldFocused,
    @required this.onFetchMoreDataRequested,
  });
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBarSearchPage(
          onSearchButtonPressed: onSearchButtonPressed,
          onSearchFieldFocused: onSearchFieldFocused,
        ),
        body: _buildBody(),
      ),
    );
  }
  
  Widget _buildBody() {
    switch (searchPageMode) {
      case SearchPageMode.searching:
        return _buildSearchResults();
      case SearchPageMode.editingSearchQuery:
        return SearchHistory();
      default:
        throw Exception(
          'Unknown SearchPageMode detected: $searchPageMode; Cannot proceed to build widget');
    }
  }
  
  Widget _buildSearchResults() {
    return SearchResults(
      imageList: imageList,
      isLoadingData: isLoadingData,
      onFetchMoreDataRequested: onFetchMoreDataRequested,
    );
  }
}
