enum ImageUrlTypes { RAW, FULL, REGULAR, SMALL, THUMB }

class Image {
  final String id;
  final String altDesc;
  final Map<String, dynamic> urls;

  Image({this.id, this.urls, this.altDesc});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
        id: json['id'], urls: json['urls'], altDesc: json['alt_description']);
  }

  static List<Image> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return List<Image>.generate(
      jsonList.length,
      (index) => Image.fromJson(jsonList[index]),
    );
  }

  String getUrl(ImageUrlTypes urlType) {
    switch (urlType) {
      case ImageUrlTypes.RAW:
        return this.urls['raw'];
      case ImageUrlTypes.REGULAR:
        return this.urls['regular'];
      case ImageUrlTypes.FULL:
        return this.urls['full'];
      case ImageUrlTypes.SMALL:
        return this.urls['small'];
      case ImageUrlTypes.THUMB:
        return this.urls['thumb'];
      default:
        throw new Exception('Invalid urlType: $urlType');
    }
  }

  @override
  String toString() {
    return "{'id': $id, 'altDesc': $altDesc}\n";
  }
}
