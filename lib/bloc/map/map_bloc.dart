import 'dart:convert';

import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/location/location_bloc.dart';
import 'package:app_sig_proyect/bloc/map/helpers/helpers.dart';
import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:app_sig_proyect/features/map/infrastructure/repositories/stand_repository_impl.dart';
import 'package:app_sig_proyect/helpers/custom_image_marker.dart';
import 'package:app_sig_proyect/theme/mapTheme.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? mapController;
  final NavigationBarBloc navigationBarBloc;
  final InfoMarkerBloc infoMarkerBloc;
  final LocationBloc locationBloc;
  final standRepositoryImpl = StandRepositoryImpl();

  MapBloc(
      {required this.navigationBarBloc,
      required this.infoMarkerBloc,
      required this.locationBloc})
      : super(MapState()) {
    on<OnMapInitialControllerMap>(_onInitialControllerMap);
    on<OnInitialFigures>(_onInitialFigures);
    on<OnChangeTerrainMap>(_onChangeTerrainMap);
    on<OnCleanTerrainMap>(_onCleanTerrainMap);
    on<OnProcessingMaps>((event, emit) {
      emit(state.copyWith(statusMap: event.statusMap));
    });
    on<OnToggleUserRoute>((event, emit) {
      emit(state.copyWith(showMyRoute: !state.showMyRoute));
    });
    on<OnChangedStatudFollowUser>(_onChangedStatudFollowUser);
    on<OnFollowingUserPaint>(_onFollowingUserPaint);

    on<OnDrawStandFake>((event, emit) async {
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      final currentMarkers = Map<String, Marker>.from(state.markers);

      List<LatLng> listPointsPolygono = [
        const LatLng(-17.78089402, -63.18959036),
        const LatLng(-17.78100344, -63.18958846),
        const LatLng(-17.78100344, -63.18957180),
        const LatLng(-17.78093682, -63.18957133),
        const LatLng(-17.78093730, -63.18953849),
        const LatLng(-17.78089400, -63.18953954),
      ];
      const pointMarker = LatLng(-17.78091547, -63.18956431);

      final polygon = Polygon(
        polygonId: const PolygonId('PGSE'),
        points: listPointsPolygono,
        strokeWidth: 4,
        strokeColor: Colors.black,
        fillColor: Colors.yellow,
      );

      final marker = Marker(
          markerId: const MarkerId("MPCSE"),
          icon: await getNetworkImageMarker(
              'https://res.cloudinary.com/da9xsfose/image/upload/v1703010264/gnonglylfqfutqeqgewi.png'),
          position: pointMarker,
          onTap: () {
            infoMarkerBloc
                .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
          });

      currentPolygons['PGSE'] = polygon;
      currentMarkers['MPCSE'] = marker;

      emit(state.copyWith(polygons: currentPolygons, markers: currentMarkers));
    });

    on<OnDrawSpecificStand>((event, emit) async {
      try {
        final response =
            await standRepositoryImpl.getPointsGeoStand(event.idStand);
        List<LatLng> points = [];
        points = response.map((e) => LatLng(e.latitude, e.longitude)).toList();

        final currentPolygons = Map<String, Polygon>.from(state.polygons);
        final currentMarkers = Map<String, Marker>.from(state.markers);

        // Puntos Geograficos de Stand Espesifica
        final polygon = Polygon(
          polygonId: const PolygonId('PGSE'),
          points: points,
          strokeWidth: 4,
          strokeColor: Colors.black,
          fillColor: Colors.yellow,
        );

        // Marcador Punto Central del Stand Especifico
        final marker = Marker(
            markerId: const MarkerId("MPCSE"),
            icon: await getNetworkImageMarker(
                'https://res.cloudinary.com/da9xsfose/image/upload/v1703010264/gnonglylfqfutqeqgewi.png'),
            position: event.markerStand,
            onTap: () {
              infoMarkerBloc
                  .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
            });

        currentPolygons['PGSE'] = polygon;
        currentMarkers['MPCSE'] = marker;

        emit(
            state.copyWith(polygons: currentPolygons, markers: currentMarkers));
      } catch (e) {
        throw Exception();
      }
    });

    on<OnDrawStandGeoRoute>((event, emit) async {
      try {
        final response = await standRepositoryImpl.getPointsGeoRouteStand(
            event.nrStand, event.nameEntrance);

        final currentPolyines = Map<String, Polyline>.from(state.polylines);
        List<LatLng> points = [];
        points = response.map((e) => LatLng(e.latitude, e.longitude)).toList();

        Set<LatLng> uniquePoints = Set<LatLng>.from(points);
        List<LatLng> uniquePointsList = uniquePoints.toList();

        points = uniquePointsList;

        // RUTA GEOIGRAFICA DE ENTRADA HASTA EL STAND
        final polyline = Polyline(
          polylineId: const PolylineId('RGES'),
          points: points,
          color: Colors.blue,
          width: 4,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ],
        );
        currentPolyines['RGES'] = polyline;
        emit(state.copyWith(polylines: currentPolyines));
      } catch (e) {
        throw Exception();
      }
    });

    locationBloc.stream.listen((locationState) {
      if (locationState.latKnowLocation != null) {
        add(OnFollowingUserPaint(locationState.myLocationHisyory));
      }
      // if (!state.followUser) return;
      // if (locationState.latKnowLocation == null) return;
      // moveCameraMyLocation(locationState.latKnowLocation!);
    });
  }

  void _onFollowingUserPaint(
      OnFollowingUserPaint event, Emitter<MapState> emit) {
    final myRoute = Polyline(
      polylineId: const PolylineId("myRoute"),
      points: event.userLocations,
      color: Colors.black,
      width: 4,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      patterns: [
        PatternItem.dash(20),
        PatternItem.gap(10),
      ],
    );
    final currentPolyline = Map<String, Polyline>.from(state.polylines);
    currentPolyline['myRoute'] = myRoute;
    emit(state.copyWith(polylines: currentPolyline));
  }

  void _onChangedStatudFollowUser(
      OnChangedStatudFollowUser event, Emitter<MapState> emit) {
    emit(state.copyWith(followUser: true));
  }

  Future<void> _onChangeTerrainMap(
      OnChangeTerrainMap event, Emitter<MapState> emit) async {
    // MODALIDAD CASETA
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.caseta) {
      // Crear el marcador del Cneotr Comercial Cañoto
      // final markerInitial = await HP().markerMall();
      final markerInitial = await markerMall();

      //Guarda los marcadores actuales
      final currentMarkers = Map<String, Marker>.from(state.markers);
      //Guardo un nuevo marcador
      currentMarkers['MGmall'] = markerInitial;
      //Guarda los poligonos actuales
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      //Guarda los poligonos de casetas del KML
      currentPolygons.addAll(await HP().loadKML("assets/doc.kml"));
      emit(state.copyWith(markers: currentMarkers, polygons: currentPolygons));
    }

    // MODALIDAD ENTRADA
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.entrada) {
      final currentMarkers = Map<String, Marker>.from(state.markers);
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      currentMarkers.addAll(await HP().entryMarkers());
      currentPolygons.addAll(await HP().loadKML("assets/doc.kml"));
      emit(state.copyWith(markers: currentMarkers, polygons: currentPolygons));
    }

    // MODALIDAD PASILLO
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.pasillo) {
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      final currentMarkers = Map<String, Marker>.from(state.markers);
      final currentPolyines = Map<String, Polyline>.from(state.polylines);
      // currentMarkers.addAll(await HP().entryMarkers());
      currentMarkers.addAll(await HP().hallwayMarker());
      currentPolyines.addAll(await HP().hallWays());
      currentPolygons.addAll(await HP().loadKML("assets/doc1.kml"));
      emit(state.copyWith(
          polylines: currentPolyines,
          markers: currentMarkers,
          polygons: currentPolygons));
    }
  }

  Future<void> _onCleanTerrainMap(
      OnCleanTerrainMap event, Emitter<MapState> emit) async {
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.caseta) {
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      final currentMarkers = Map<String, Marker>.from(state.markers);
      currentMarkers.removeWhere((key, value) => key.contains('MG'));
      currentPolygons.removeWhere((key, value) => key.contains('PCM'));
      emit(state.copyWith(polygons: currentPolygons, markers: currentMarkers));
    }
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.pasillo) {
      final currentMarkers = Map<String, Marker>.from(state.markers);
      final currentPolyines = Map<String, Polyline>.from(state.polylines);
      currentMarkers.removeWhere(
          (key, value) => key.contains('PGMP') || key.contains("PGME"));
      currentPolyines.removeWhere((key, value) => key.contains("PGP"));
      emit(state.copyWith(polylines: currentPolyines, markers: currentMarkers));
    }
    if (navigationBarBloc.state.detailsMap == StatuDetailsMap.entrada) {
      final currentPolygons = Map<String, Polygon>.from(state.polygons);
      final currentMarkers = Map<String, Marker>.from(state.markers);
      currentMarkers.removeWhere((key, value) => key.contains("PGME"));
      currentPolygons.removeWhere((key, value) => key.contains('PCM'));
      emit(state.copyWith(polygons: currentPolygons, markers: currentMarkers));
    }
  }

  Future<void> _onInitialControllerMap(
      OnMapInitialControllerMap event, Emitter<MapState> emit) async {
    mapController = event.controller;
    mapController!.setMapStyle(jsonEncode(mapTheme));
    emit(state.copyWith(
      isMapInitialized: true,
    ));
  }

  Future<void> _onInitialFigures(
      OnInitialFigures event, Emitter<MapState> emit) async {
    // Future.microtask(() {
    //   print(state.polygons);
    //   print(state.markers);
    // });
  }

  void moveCameraMyLocation(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(newLocation, 17);
    mapController!.animateCamera(cameraUpdate);
  }

  void moveCameraTo(LatLng newLocation) {
    mapController!.animateCamera(CameraUpdate.newLatLngZoom(newLocation, 19));
  }

  void moveCameraToPersonalized(LatLng newLocation) {
    mapController!.animateCamera(CameraUpdate.newLatLngZoom(newLocation, 21));
  }

  Future<Marker> markerMall() async {
    final iconMarker = await getNetworkImageMarker(
        'https://res.cloudinary.com/da9xsfose/image/upload/v1702229066/f2wqsssq9k9y2izqhvsd.png');

    final markerInitial = Marker(
      markerId: const MarkerId('MGmall'),
      position: const LatLng(-17.780728, -63.189620),
      icon: iconMarker,
      onTap: () {
        infoMarkerBloc.add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
      },
    );

    return markerInitial;
  }
}
