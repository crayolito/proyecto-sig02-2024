part of 'map_bloc.dart';

class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnInsertMarker extends MapEvent {}

class OnMapInitialControllerMap extends MapEvent {
  final GoogleMapController controller;
  OnMapInitialControllerMap(this.controller);
}

class OnInitialFigures extends MapEvent {
  const OnInitialFigures();
}

class OnChangeTerrainMap extends MapEvent {
  const OnChangeTerrainMap();
}

class OnCleanTerrainMap extends MapEvent {
  const OnCleanTerrainMap();
}

class OnProcessingMaps extends MapEvent {
  final MapStatus statusMap;
  const OnProcessingMaps(this.statusMap);
}

class OnChangedStatudFollowUser extends MapEvent {
  final bool statusFollow;
  const OnChangedStatudFollowUser(this.statusFollow);
}

class OnFollowingUserPaint extends MapEvent {
  final List<LatLng> userLocations;
  const OnFollowingUserPaint(this.userLocations);
}

class OnToggleUserRoute extends MapEvent {
  const OnToggleUserRoute();
}

class OnDrawSpecificStand extends MapEvent {
  final int idStand;
  final LatLng markerStand;

  const OnDrawSpecificStand(
    this.idStand,
    this.markerStand,
  );
}

class OnDrawStandGeoRoute extends MapEvent {
  final String nrStand;
  final String nameEntrance;

  const OnDrawStandGeoRoute(
      {required this.nrStand, required this.nameEntrance});
}

class OnDrawStandFake extends MapEvent {
  const OnDrawStandFake();
}
