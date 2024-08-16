
// List<RouteGeo> routeGeoFromJson(String str) =>
//     List<RouteGeo>.from(json.decode(str).map((x) => RouteGeo.fromJson(x)));

// String routeGeoToJson(List<RouteGeo> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteGeo {
  int id;
  double longitude;
  double latitude;
  String nrStand;
  String nameEntrance;
  DateTime createdAt;

  RouteGeo({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.nrStand,
    required this.nameEntrance,
    required this.createdAt,
  });


}
