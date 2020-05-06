import 'dart:convert';

class Image {
  final String id;
  final String altDesc;
  final Map<String, dynamic> urls;

  Image({this.id, this.urls, this.altDesc});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
        id: json['id'], urls: json["urls"], altDesc: json['alt_description']);
  }

  @override
  String toString() {
    return '{\nid: ' + id + '\naltDesc: ' + altDesc + '}\n';
  }
}
