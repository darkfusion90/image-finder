import 'package:flutter/material.dart';
import 'package:searchimages/widgets/SearchForm.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> _onSearchFormSubmit;

  SearchBar(this._onSearchFormSubmit);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SearchForm(this._onSearchFormSubmit),
    );
  }
}
