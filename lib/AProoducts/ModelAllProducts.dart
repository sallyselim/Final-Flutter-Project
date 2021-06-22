class ModelAllproducts {
List<Products> _products;

List<Products> get products => _products;

ModelAllproducts({
  List<Products> products}) {
  _products = products;
}

ModelAllproducts.fromJson(dynamic json) {
if (json["products"] != null) {
_products = [];
json["products"].forEach((v) {
_products.add(Products.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
  var map = <String, dynamic>{};
  if (_products != null) {
    map["products"] = _products.map((v) => v.toJson()).toList();
  }
  return map;
}

}

class Products {
  int _id;
  String _name;
  String _title;
  int _categoryId;
  dynamic _description;
  int _price;
  int _discount;
  dynamic _discountType;
  String _currency;
  int _inStock;
  String _avatar;
  double _priceFinal;
  String _priceFinalText;

  int get id => _id;

  String get name => _name;

  String get title => _title;

  int get categoryId => _categoryId;

  dynamic get description => _description;

  int get price => _price;

  int get discount => _discount;

  dynamic get discountType => _discountType;

  String get currency => _currency;

  int get inStock => _inStock;

  String get avatar => _avatar;

  double get priceFinal => _priceFinal;

  String get priceFinalText => _priceFinalText;

  Products({
    int id,
    String name,
    String title,
    int categoryId,
    dynamic description,
    int price,
    int discount,
    dynamic discountType,
    String currency,
    int inStock,
    String avatar,
    double priceFinal,
    String priceFinalText}) {
    _id = id;
    _name = name;
    _title = title;
    _categoryId = categoryId;
    _description = description;
    _price = price;
    _discount = discount;
    _discountType = discountType;
    _currency = currency;
    _inStock = inStock;
    _avatar = avatar;
    _priceFinal = priceFinal;
    _priceFinalText = priceFinalText;
  }

  Products.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _title = json["title"];
    _categoryId = json["category_id"];
    _description = json["description"];
    _price = json["price"];
    _discount = json["discount"];
    _discountType = json["discount_type"];
    _currency = json["currency"];
    _inStock = json["in_stock"];
    _avatar = json["avatar"];
    ///  _priceFinal = json["price_final"];
    _priceFinalText = json["price_final_text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["title"] = _title;
    map["category_id"] = _categoryId;
    map["description"] = _description;
    map["price"] = _price;
    map["discount"] = _discount;
    map["discount_type"] = _discountType;
    map["currency"] = _currency;
    map["in_stock"] = _inStock;
    map["avatar"] = _avatar;
    map["price_final"] = _priceFinal;
    map["price_final_text"] = _priceFinalText;
    return map;
  }

}