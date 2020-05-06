import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:searchimages/utils/Image.dart' as fromUtils;
import 'package:searchimages/utils/api.dart' as api;

class SearchResults extends StatefulWidget {
  final String searchQuery;

  SearchResults(this.searchQuery);

  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  Future<List<fromUtils.Image>> _futureImageList;

  Widget _buildGridTile(img) {
    return Image(image: NetworkImage(img.urls['thumb']));
  }

  Widget _buildEmptySearchResults() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'No results :(',
              style: TextStyle(fontSize: 22, backgroundColor: Colors.green),
            ),
          )
        ]);
  }

  Widget _buildData(data) {
    if (data.isEmpty) {
      return _buildEmptySearchResults();
    }

    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: data.length + 1,
      itemBuilder: (context, index) {
        return index == data.length
            ? Center(child: CircularProgressIndicator())
            : _buildGridTile(data[index]);
      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
    );
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

    if (didQueryUpdate()) {
      setState(() {
        _futureImageList = api.fetchImages(widget.searchQuery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<fromUtils.Image>>(
        future: _futureImageList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildData(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}
