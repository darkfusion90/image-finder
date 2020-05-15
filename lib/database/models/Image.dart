enum ImageUrlTypes { RAW, FULL, REGULAR, SMALL, THUMB }

const Map<ImageUrlTypes, int> IMAGE_WIDTHS = {
  ImageUrlTypes.REGULAR: 1080,
  ImageUrlTypes.SMALL: 400,
  ImageUrlTypes.THUMB: 200,
};

class ImageModel {
  final String id;
  final String altDesc;
  final int width;
  final int height;
  final Map<String, dynamic> urls;
  double aspectRatio;

  ImageModel(this.id, this.width, this.height, this.urls, this.altDesc) {
    this.aspectRatio = this.width / this.height;
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      json['id'],
      json['width'],
      json['height'],
      json['urls'],
      json['alt_description'],
    );
  }

  static List<ImageModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return List<ImageModel>.generate(
      jsonList.length,
      (index) => ImageModel.fromJson(jsonList[index]),
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

  int getWidth({ImageUrlTypes urlType}) {
    return IMAGE_WIDTHS.containsKey(urlType)
        ? IMAGE_WIDTHS[urlType]
        : this.width;
  }

  int getHeight({ImageUrlTypes urlType}) {
    return IMAGE_WIDTHS.containsKey(urlType)
        ? this._calculateImageHeight(IMAGE_WIDTHS[urlType])
        : this.height;
  }

  int _calculateImageHeight(int width) {
    //Operator ~/ returns the int value casted from the expression
    return width ~/ aspectRatio;
  }

  @override
  String toString() {
    return "{'id': $id, 'altDesc': $altDesc}\n";
  }
}
