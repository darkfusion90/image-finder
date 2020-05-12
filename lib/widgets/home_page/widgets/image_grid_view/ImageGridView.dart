import'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ImageGridTile.dart' show ImageGridTile;
import 'package:searchimages/models/main.dart' as models;

class ImageGridView extends StatefulWidget {
  final List<models.Image> _imageList;
  final VoidCallback _fetchMoreData;

  ImageGridView(this._imageList, this._fetchMoreData);

  @override
  State<StatefulWidget> createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  static const int ITEMS_PER_ROW = 2;
  static const double SCROLL_POSITION_REMAINING_TO_CONSIDER_FETCH_MORE_DATA = 0;

  final List<double> _visitedScrollEndPositions = new List<double>();

  @override
  Widget build(BuildContext context) {
    final int itemCountWithExtraForSpinner = widget._imageList.length + 1;

    return NotificationListener<ScrollNotification>(
      onNotification: _scrollListener,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: ITEMS_PER_ROW,
        itemCount: itemCountWithExtraForSpinner,
        itemBuilder: _buildGridTile,
        staggeredTileBuilder: (index) =>
            new StaggeredTile.fit(_getItemCountToFitInRow(index)),
      ),
    );
  }

  Widget _buildGridTile(BuildContext context, int index) {
    return index == widget._imageList.length
        ? _buildLoaderFooter()
        : ImageGridTile(widget._imageList[index]);
  }

  Widget _buildLoaderFooter() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
      padding: EdgeInsets.all(16.0),
    );
  }

  int _getItemCountToFitInRow(index) {
    final int fitOneItemPerRow = ITEMS_PER_ROW ~/ 2;

    return index == widget._imageList.length ? ITEMS_PER_ROW : fitOneItemPerRow;
  }

  bool _hasPositionAlreadyVisited(double position) {
    return _visitedScrollEndPositions.contains(position);
  }

  bool _scrollListener(ScrollNotification scrollNotification) {
    bool _isNearingScreenEnd() {
      return scrollNotification.metrics.extentAfter <=
          SCROLL_POSITION_REMAINING_TO_CONSIDER_FETCH_MORE_DATA;
    }

    bool _shouldFetchMoreData() {
      return scrollNotification is ScrollEndNotification &&
          _isNearingScreenEnd() &&
          !_hasPositionAlreadyVisited(scrollNotification.metrics.pixels);
    }

    if (_shouldFetchMoreData()) {
      setState(() {
        _visitedScrollEndPositions.add(scrollNotification.metrics.pixels);
      });
      widget._fetchMoreData();
    }

    return false;
  }
}
