import 'package:app_sig_proyect/data/producto-data.dart';
import 'package:app_sig_proyect/helpers/custom_image_marker.dart';
import 'package:app_sig_proyect/helpers/widget_to_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xml/xml.dart' as xml;

class HP {
  Future<Map<String, Polygon>> loadKML(String direction) async {
    // String kmlString = await rootBundle.loadString('assets/doc.kml');
    String kmlString = await rootBundle.loadString(direction);

    final document = xml.XmlDocument.parse(kmlString);
    Map<String, Polygon> polygons = {};
    int i = 0;

    document.findAllElements('Placemark').forEach((placemarkElement) {
      placemarkElement
          .findAllElements('MultiGeometry')
          .forEach((multiGeometryElement) {
        multiGeometryElement
            .findAllElements('Polygon')
            .forEach((polygonElement) {
          polygonElement
              .findAllElements('outerBoundaryIs')
              .forEach((outerBoundaryIsElement) {
            outerBoundaryIsElement
                .findAllElements('LinearRing')
                .forEach((linearRingElement) {
              linearRingElement
                  .findAllElements('coordinates')
                  .forEach((coordinatesElement) {
                List<LatLng> polygonCoordinates = [];
                String coordinates = coordinatesElement.text.trim();
                List<String> coordinateTuples =
                    coordinates.split(RegExp(r'\s+|\n+'));

                coordinateTuples.forEach((coordinateTuple) {
                  coordinateTuple = coordinateTuple.trim();
                  List<String> latLng = coordinateTuple.split(',');
                  if (latLng.length >= 2) {
                    double lat = double.parse(latLng[1]);
                    double lng = double.parse(latLng[0]);
                    polygonCoordinates.add(LatLng(lat, lng));
                  }
                });

                // POLIGONO CASETA MAPA
                polygons["PCM$i"] = Polygon(
                  polygonId: PolygonId("PCM$i"),
                  points: polygonCoordinates,
                  fillColor: Color(0xFF20D16A).withOpacity(0.4),
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                );
                i++;
              });
            });
          });
        });
      });
    });

    return polygons;
  }

  // MARCADORES DE ENTRADAS
  Future<Map<String, Marker>> entryMarkers() async {
    Map<String, Marker> auxMapMarkers = {};
    final iconMarker = await getNetworkImageMarker(
        'https://res.cloudinary.com/da9xsfose/image/upload/v1703010266/dxtbt5xu4efhmgxqo0cu.png');

    coordenadasMarkerEntrada.forEach((key, value) {
      String entrada = key.characters.last;

      final marker = Marker(
        markerId: MarkerId(key),
        position: value,
        icon: iconMarker,
        infoWindow: InfoWindow(
          title: 'Entrada $entrada',
        ),
      );

      auxMapMarkers[key] = marker;
    });

    return auxMapMarkers;
  }

  // MARCADORES REFERENCIALES NAME PASILLOS
  Future<Map<String, Marker>> hallwayMarker() async {
    List<String> keysPasillos = coordenadasMarkerPasillos.keys.toList();
    Map<String, Marker> auxMarcadoresPasillos = {};

    for (var key in keysPasillos) {
      String idPasillo = key.characters.last;
      coordenadasMarkerPasillos[key]!;
      final markerPasillo = Marker(
        markerId: MarkerId(key),
        position: coordenadasMarkerPasillos[key]!,
        icon: await getCustomMarker("PASILLO $idPasillo"),
        infoWindow: InfoWindow(
          title: 'Pasillo $idPasillo',
        ),
      );
      auxMarcadoresPasillos[key] = markerPasillo;
    }
    return auxMarcadoresPasillos;
  }

  // POLILINEAS DE LOS PASILLOS
  Future<Map<String, Polyline>> hallWays() async {
    List<String> keysHallWay = coordenadasPasillos.keys.toList();
    Map<String, Polyline> auxPolylineasPasillos = {};

    for (var i = 0; i < keysHallWay.length; i += 2) {
      final idPasillo = keysHallWay[i].substring(0, keysHallWay[i].length - 1);
      final polyline = Polyline(
          polylineId: PolylineId(idPasillo),
          points: [
            coordenadasPasillos[keysHallWay[i]]!,
            coordenadasPasillos[keysHallWay[i + 1]]!,
          ],
          color: Colors.black,
          width: 4,
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ]);

      auxPolylineasPasillos[idPasillo] = polyline;
    }

    return auxPolylineasPasillos;
  }
}
