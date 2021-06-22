
class ModelCategories {
  List<Categories> _categories;

  List<Categories> get categories => _categories;

  ModelCategories({List<Categories> categories}) {
    _categories = categories;
  }

  ModelCategories.fromJson(dynamic json) {
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  int _id;
  String _name;
  String _avatar;

  int get id => _id;

  String get name => _name;

  String get avatar => _avatar;

  Categories({int id, String name, String avatar}) {
    _id = id;
    _name = name;
    _avatar = avatar;
  }

  Categories.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["avatar"] = _avatar;
    return map;
  }
}