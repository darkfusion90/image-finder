import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  final ValueChanged<String> _onFormSubmit;

  SearchForm(this._onFormSubmit);

  @override
  State<StatefulWidget> createState() => SearchFormState();
}

class SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  final _searchQueryController = TextEditingController();

  Widget _buildSearchQueryField() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Type something to search for'),
      controller: _searchQueryController,
    );
  }

  Widget _buildSubmitButton() {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        widget._onFormSubmit(_searchQueryController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _buildSearchQueryField(),
          ),
          _buildSubmitButton()
        ],
      ),
    );
  }
}
