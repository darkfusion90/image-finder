import 'package:flutter/material.dart';

import 'package:searchimages/database/models/main.dart' as models;
import 'image_grid_view/ImageGridView.dart';

class SearchResults extends StatelessWidget {
  final List<models.ImageModel> imageList;
  final bool isLoadingData;
  final VoidCallback onFetchMoreDataRequested;

  const SearchResults({
    @required this.imageList,
    @required this.isLoadingData,
    @required this.onFetchMoreDataRequested,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoadingData && imageList.isEmpty) {
      return _buildLoader();
    }

    if (imageList.isEmpty) {
      return _buildEmptySearchResults();
    }

    return ImageGridView(
      imageList,
      fetchMoreData: onFetchMoreDataRequested,
    );
  }

  Widget _buildLoader() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptySearchResults() {
    return Center(
      child: Column(
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
        ],
      ),
    );
  }
}
