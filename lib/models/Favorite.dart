import 'package:uuid/uuid.dart' show Uuid;
import 'package:searchimages/models/Image.dart' show Image;

class Favorite {
  final String _id = Uuid().v1();
  final Image image;

  Favorite(this.image);

  Map<String, dynamic> toMap() {
    return {'id': _id, 'image': image};
  }
}
