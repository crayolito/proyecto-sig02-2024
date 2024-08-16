//


// List<PointGeo> pointGeoFromJson(String str) =>
//     List<PointGeo>.from(json.decode(str).map((x) => PointGeo.fromJson(x)));

// String pointGeoToJson(List<PointGeo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PointGeo {
  int id;
  double longitude;
  double latitude;
  int order;
  int standId;
  DateTime createdAt;

  PointGeo({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.order,
    required this.standId,
    required this.createdAt,
  });


}
