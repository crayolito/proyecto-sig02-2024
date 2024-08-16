import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xml/xml.dart' as xml;

class ConvertKMLPolyline {
  Future<List<List<LatLng>>> parseKML(String kmlString) async {
    final document = xml.XmlDocument.parse(kmlString);
    List<List<LatLng>> polygons = [];

    // Itera sobre los elementos KML para encontrar polígonos
    document.findAllElements('Polygon').forEach((polygonElement) {
      List<LatLng> polygonCoordinates = [];

      // Extrae las coordenadas del polígono
      polygonElement.findElements('coordinates').forEach((coordinatesElement) {
        String coordinates = coordinatesElement.text.trim();
        List<String> coordinateTuples = coordinates.split(' ');

        // Itera sobre las coordenadas y agrégales a la lista
        coordinateTuples.forEach((coordinateTuple) {
          List<String> latLng = coordinateTuple.split(',');
          double lat = double.parse(latLng[1]);
          double lng = double.parse(latLng[0]);
          polygonCoordinates.add(LatLng(lat, lng));
        });
      });

      // Agrega las coordenadas del polígono a la lista de polígonos
      polygons.add(polygonCoordinates);
    });

    return polygons;
  }
}
