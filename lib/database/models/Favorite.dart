class Favorite {
  int id;
  final String imageId;

  Favorite(this.imageId, {this.id});

  void setId(int id) {
    this.id = id;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'image': imageId};
  }

  static Favorite fromMap(Map<String, dynamic> map) {
    return Favorite(map['image'], id: map['id']);
  }

  static List<Favorite> fromMaps(List<Map<String, dynamic>> maps) {
    return List<Favorite>.generate(
      maps.length,
      (index) => fromMap(maps[index]),
    );
  }

  @override
  String toString() {
    return "{'id': $id, 'image': $imageId}\n";
  }
}
