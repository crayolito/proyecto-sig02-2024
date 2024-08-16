import 'package:app_sig_proyect/features/map/domain/entities/pointGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:app_sig_proyect/features/map/domain/entities/routeGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';

abstract class StandDataSource {
  Future<List<Stand>> getStands();
  Future<List<PointGeo>> getPointsGeoStand(int idStand);
  Future<List<RouteGeo>> getPointsGeoRouteStand(
      String nrStand, String nameEntrance);
  Future<List<Product>> getProducts();
}
