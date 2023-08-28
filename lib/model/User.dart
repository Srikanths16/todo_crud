class User {
  int? id;
  String? name;
  String? description;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['description'] = description!;
    return mapping;
  }
}
