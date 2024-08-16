// To parse this JSON data, do
//
//     final stand = standFromJson(jsonString);


// List<Stand> standFromJson(String str) =>
//     List<Stand>.from(json.decode(str).map((x) => Stand.fromJson(x)));

// String standToJson(List<Stand> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stand {
  int id;
  String name;
  String owner;
  String image;
  String direction;
  double longitude;
  double latitude;
  String nr;
  String phone;
  String urlPage;
  DateTime createdAt;

  Stand({
    required this.id,
    required this.name,
    required this.owner,
    required this.image,
    required this.direction,
    required this.longitude,
    required this.latitude,
    required this.nr,
    required this.phone,
    required this.urlPage,
    required this.createdAt,
  });


}
