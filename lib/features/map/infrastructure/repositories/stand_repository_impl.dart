import 'package:app_sig_proyect/features/map/domain/datasources/stand_datasource.dart';
import 'package:app_sig_proyect/features/map/domain/entities/pointGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:app_sig_proyect/features/map/domain/entities/routeGeo.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:app_sig_proyect/features/map/domain/repositories/stand_repository.dart';
import 'package:app_sig_proyect/features/map/infrastructure/datasources/stand_datasource_impl.dart';

class StandRepositoryImpl extends StandRepository {
  final StandDataSource dataSource;

  StandRepositoryImpl({StandDataSource? dataSource})
      : dataSource = dataSource ?? StandDataSourceImpl();

  @override
  Future<List<Stand>> getStands() async {
    return await dataSource.getStands();
  }

  @override
  Future<List<PointGeo>> getPointsGeoStand(int idStand) async {
    return await dataSource.getPointsGeoStand(idStand);
  }

  @override
  Future<List<RouteGeo>> getPointsGeoRouteStand(
      String nrStand, String nameEntrance) async {
    return await dataSource.getPointsGeoRouteStand(nrStand, nameEntrance);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await dataSource.getProducts();
  }
}
