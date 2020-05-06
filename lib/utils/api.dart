import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:searchimages/utils/Image.dart' as fromUtils;

const String UNSPLASH_HOME = 'https://api.unsplash.com';
const String ACCESS_TOKEN = 'zBbkwz06KIzPAhpxwhhAebWgSOuDavbMZJdnVo91uVo';

String constructUrl(subUrl) {
  return UNSPLASH_HOME + subUrl + '&client_id=' + ACCESS_TOKEN;
}

Future<http.Response> _searchImages(String query) {
  return http.get(constructUrl('/search/photos/?query=' + query));
}

Future<List<fromUtils.Image>> fetchImages(String query) async {
  final response = await _searchImages(query);

  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);

    List<dynamic> decodedJsonResults = responseJson['results'];
    List<fromUtils.Image> images = decodedJsonResults
        .map((json) => fromUtils.Image.fromJson(json))
        .toList();

    return images;
  } else {
    throw Exception('error fetching images: ' + response.body);
  }
}
