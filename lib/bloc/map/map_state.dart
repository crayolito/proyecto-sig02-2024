part of 'map_bloc.dart';

enum MapStatus { loaded, processing, error }
// Cargado, procesando, error

// ignore: must_be_immutable
class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final bool showMyRoute;
  Map<String, Polyline> polylines;
  Map<String, Marker> markers;
  Map<String, Polygon> polygons;
  final MapStatus statusMap;

  MapState({
    this.statusMap = MapStatus.loaded,
    this.isMapInitialized = false,
    this.followUser = false,
    this.showMyRoute = false,
    Map<String, Marker>? markers,
    Map<String, Polyline>? polylines,
    Map<String, Polygon>? polygons,
  })  : markers = markers ?? {},
        polylines = polylines ?? {},
        polygons = polygons ?? {};

  MapState copyWith({
    MapStatus? statusMap,
    bool? isMapInitialized,
    bool? followUser,
    bool? showMyRoute,
    Map<String, Marker>? markers,
    Map<String, Polyline>? polylines,
    Map<String, Polygon>? polygons,
  }) =>
      MapState(
        showMyRoute: showMyRoute ?? this.showMyRoute,
        statusMap: statusMap ?? this.statusMap,
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        followUser: followUser ?? this.followUser,
        markers: markers ?? this.markers,
        polylines: polylines ?? this.polylines,
        polygons: polygons ?? this.polygons,
      );

  @override
  List<Object> get props => [
        isMapInitialized,
        followUser,
        polylines,
        markers,
        polygons,
        statusMap,
        showMyRoute,
      ];
}
