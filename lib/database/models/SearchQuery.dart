class SearchQuery {
  int id;
  final String query;
  final DateTime queryDateTime;

  SearchQuery(this.query, this.queryDateTime, {this.id});

  void setId(int id) {
    this.id = id;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'query': query,
      'queriedOn': queryDateTime.toIso8601String()
    };
  }

  static SearchQuery fromMap(Map<String, dynamic> map) {
    return SearchQuery(
      map['query'],
      DateTime.parse(map['queriedOn']),
      id: map['id'],
    );
  }

  static List<SearchQuery> fromMaps(List<Map<String, dynamic>> maps) {
    return List<SearchQuery>.generate(
      maps.length,
      (index) => fromMap(maps[index]),
    );
  }

  @override
  String toString() {
    return "{'id': $id, 'query': $query}\n";
  }
}
