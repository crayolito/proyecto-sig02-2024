import 'package:app_sig_proyect/features/map/domain/datasources/stand_datasource.dart';
import 'package:app_sig_proyect/features/map/domain/entities/Stands.dart';
import 'package:app_sig_proyect/features/map/domain/entities/pointGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/pointsGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:app_sig_proyect/features/map/domain/entities/productos.dart';
import 'package:app_sig_proyect/features/map/domain/entities/routeGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/routesGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:dio/dio.dart';

class StandDataSourceImpl extends StandDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: "https://sigproject-production.up.railway.app/api",
  ));

  @override
  Future<List<Stand>> getStands() async {
    try {
      final response = await dio.get('/stands');
      final standsReponse = Stands.convertirListStands(response.data);
      return standsReponse;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }

  @override
  Future<List<PointGeo>> getPointsGeoStand(int idStand) async {
    try {
      final response = await dio.get("/pointgeos/pointgeosbyid/$idStand");
      final pointsGeoResponse = PointsGeo.convertirListStands(response.data);
      return pointsGeoResponse;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }

  @override
  Future<List<RouteGeo>> getPointsGeoRouteStand(
      String nrStand, String nameEntrance) async {
    try {
      final response = await dio.post("/routegeo/polilineas",
          data: {"nrStand": nrStand, "nameEntrance": nameEntrance});
      final pointsRouteGeo =
          RoutesGeo.convertirListPointsRouteGeo(response.data);

      return pointsRouteGeo;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get("/products");
      final products = Products.convertirListPointsRouteGeo(response.data);
      return products;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }
}
