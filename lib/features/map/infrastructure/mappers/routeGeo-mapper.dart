import 'package:app_sig_proyect/features/map/domain/entities/routeGeo.dart';

class RouteGeoMapper {
  static RouteGeo fromJson(Map<String, dynamic> json) => RouteGeo(
        id: json["id"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        nrStand: json["nrStand"],
        nameEntrance: json["nameEntrance"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson(RouteGeo routeGeo) => {
        "id": routeGeo.id,
        "longitude": routeGeo.longitude,
        "latitude": routeGeo.latitude,
        "nrStand": routeGeo.nrStand,
        "nameEntrance": routeGeo.nameEntrance,
        "createdAt": routeGeo.createdAt.toIso8601String(),
      };
}
