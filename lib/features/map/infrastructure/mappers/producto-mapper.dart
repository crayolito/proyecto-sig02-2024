import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';

class ProductMapper {
  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        size: json["size"],
        image: json["image"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
}
