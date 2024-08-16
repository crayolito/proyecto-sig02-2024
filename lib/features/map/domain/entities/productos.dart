import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:app_sig_proyect/features/map/infrastructure/mappers/producto-mapper.dart';

class Products {
  static List<Product> convertirListPointsRouteGeo(List<dynamic> json) {
    List<Product> products = [];

    for (var element in json) {
      final product = ProductMapper.fromJson(element);
      products.add(product);
    }

    return products;
  }
}
