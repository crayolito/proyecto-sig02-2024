import 'package:app_sig_proyect/features/map/domain/entities/routeGeo.dart';
import 'package:app_sig_proyect/features/map/infrastructure/mappers/routeGeo-mapper.dart';

class RoutesGeo {
  static List<RouteGeo> convertirListPointsRouteGeo(List<dynamic> json) {
    List<RouteGeo> pointesRouteGeo = [];

    for (var element in json) {
      final routeGeo = RouteGeoMapper.fromJson(element);
      pointesRouteGeo.add(routeGeo);
    }

    return pointesRouteGeo;
  }
}
