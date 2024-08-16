import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';

class StandMapper {
  static Stand fromJson(Map<String, dynamic> json) => Stand(
        id: json["id"],
        name: json["name"],
        owner: json["owner"],
        image: json["image"],
        direction: json["direction"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        nr: json["nr"],
        phone: json["phone"],
        urlPage: json["urlPage"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  static Map<String, dynamic> toJson(Stand stand) => {
        "id": stand.id,
        "name": stand.name,
        "owner": stand.owner,
        "image": stand.image,
        "direction": stand.direction,
        "longitude": stand.longitude,
        "latitude": stand.latitude,
        "nr": stand.nr,
        "phone": stand.phone,
        "urlPage": stand.urlPage,
        "createdAt": stand.createdAt.toIso8601String(),
      };
}
