import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:searchimages/database/models/Image.dart' as models;

const String UNSPLASH_HOME = 'https://api.unsplash.com';
const String ACCESS_TOKEN = 'zBbkwz06KIzPAhpxwhhAebWgSOuDavbMZJdnVo91uVo';

String constructUrl(subUrl) {
  return UNSPLASH_HOME + subUrl + '&client_id=' + ACCESS_TOKEN;
}

Future<http.Response> _searchImages(String query, int pageNumber) {
  return http.get(constructUrl('/search/photos/?query=$query&page=$pageNumber'));
}

Future<List<models.ImageModel>> fetchImages(String query, int pageNumber) async {
  final response = await _searchImages(query, pageNumber);

  try {
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      List<dynamic> decodedJsonResults = responseJson['results'];
      List<models.ImageModel> images =
          decodedJsonResults.map((res) => models.ImageModel.fromJson(res)).toList();
    print('images: $images');
      return images;
    } else {
      throw Exception('error fetching images: ' + response.body);
    }
  } catch (on, stackTrace) {
    print('Exception: $on\nStack Trace: $stackTrace');
  }
}
