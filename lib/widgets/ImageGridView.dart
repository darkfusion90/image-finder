import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'image_container/ImageContainer.dart' show ImageContainer;
import 'package:searchimages/models/main.dart' as models;

class ImageGridView extends StatelessWidget {
  static const int ITEMS_PER_ROW = 2;

  final List<models.Image> _imageList;

  ImageGridView(this._imageList);

  @override
  Widget build(BuildContext context) {
    final int itemCountWithExtraForSpinner = _imageList.length + 1;
    return StaggeredGridView.countBuilder(
      crossAxisCount: ITEMS_PER_ROW,
      itemCount: itemCountWithExtraForSpinner,
      itemBuilder: _buildGridTile,
      staggeredTileBuilder: (index) =>
          new StaggeredTile.fit(_getItemsPerRow(index)),
    );
  }

  Widget _buildGridTile(BuildContext context, int index) {
    return index == _imageList.length
        ? _buildLoaderFooter()
        : ImageContainer(_imageList[index]);
  }

  Widget _buildLoaderFooter() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
      padding: EdgeInsets.all(16.0),
    );
  }

  int _getItemsPerRow(index) {
    final int fitOneItemPerRow = ITEMS_PER_ROW ~/ 2;

    return index == _imageList.length ? ITEMS_PER_ROW : fitOneItemPerRow;
  }
}
