import 'dart:async';

import 'package:app_sig_proyect/helpers/difencia-distancia.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(LocationState()) {
    on<OnNewUserLocationEvent>((event, emit) {
      final distancia = DifenciaDistancia().calcularDistancia(-17.780728,
          -63.189620, event.newLocation.latitude, event.newLocation.longitude);
      if (distancia < 0.084725) {
        emit(state.copyWith(
          latKnowLocation: event.newLocation,
          myLocationHisyory: [
            ...state.myLocationHisyory,
            event.newLocation,
          ],
        ));
      } else {
        emit(state.copyWith(
          latKnowLocation: event.newLocation,
        ));
      }

      // emit(state.copyWith(
      //   latKnowLocation: event.newLocation,
      //   myLocationHisyory: [
      //     ...state.myLocationHisyory,
      //     event.newLocation,
      //   ],
      // ));
    });
    on<OnStartFolowingUser>((event, emit) {
      emit(state.copyWith(isFolowingUser: true));
    });
    on<OnStopFolowingUser>((event, emit) {
      emit(state.copyWith(isFolowingUser: false));
    });
  }

  // Future getCurrentLocation() async {
  //   final position = await Geolocator.getCurrentPosition();
  //   print(position);
  // }

  Future<Position> getActualLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  void startFollowingUser() async {
    add(OnStartFolowingUser());
    positionStream = Geolocator.getPositionStream().listen((event) {
      final posititon = event;
      add(OnNewUserLocationEvent(
        LatLng(posititon.latitude, posititon.longitude),
      ));
    });
  }

  Future<void> stopFolowwingUser() async {
    await positionStream!.cancel();
    add(OnStopFolowingUser());
  }

  @override
  Future<void> close() {
    stopFolowwingUser();
    return super.close();
  }
}
