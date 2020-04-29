import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> _onInputChanged;

  SearchBar(this._onInputChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Type something to search for'),
      onChanged: this._onInputChanged,
    );
  }
}
