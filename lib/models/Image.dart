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
}
