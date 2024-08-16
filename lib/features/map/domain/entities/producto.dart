// List<Product> routeGeoFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String routeGeoToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int id;
  String name;
  String description;
  double price;
  String size;
  String image;
  int discount;
  DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.size,
    required this.image,
    required this.discount,
    required this.createdAt,
  });
}
