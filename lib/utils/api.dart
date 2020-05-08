import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:searchimages/models/Image.dart' as models;

const String UNSPLASH_HOME = 'https://api.unsplash.com';
const String ACCESS_TOKEN = 'zBbkwz06KIzPAhpxwhhAebWgSOuDavbMZJdnVo91uVo';

String constructUrl(subUrl) {
  return UNSPLASH_HOME + subUrl + '&client_id=' + ACCESS_TOKEN;
}

Future<http.Response> _searchImages(String query) {
  return http.get(constructUrl('/search/photos/?query=' + query));
}

Future<List<models.Image>> fetchImages(String query) async {
  final response = await _searchImages(query);

  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);

    List<dynamic> decodedJsonResults = responseJson['results'];

    return models.Image.fromJsonList(decodedJsonResults);
  } else {
    throw Exception('error fetching images: ' + response.body);
  }
}
