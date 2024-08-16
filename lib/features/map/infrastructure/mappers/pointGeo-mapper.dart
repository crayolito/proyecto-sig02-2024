import 'package:app_sig_proyect/features/map/domain/entities/pointGeo.dart';

class PointGeoMapper {
  static PointGeo fromJson(Map<String, dynamic> json) => PointGeo(
        id: json["id"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        order: json["order"],
        standId: json["stand_id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson(PointGeo pointGeo) => {
        "id": pointGeo.id,
        "longitude": pointGeo.longitude,
        "latitude": pointGeo.latitude,
        "order": pointGeo.order,
        "stand_id": pointGeo.standId,
        "createdAt": pointGeo.createdAt.toIso8601String(),
      };
}
