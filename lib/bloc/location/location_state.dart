part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool isFolowingUser;

  //Ultima ubicacion que conozco del usuario
  final LatLng? latKnowLocation;

  final List<LatLng> myLocationHisyory;

  const LocationState(
      {this.isFolowingUser = false, this.latKnowLocation, myLocationHisyory})
      : myLocationHisyory = myLocationHisyory ??
            const []; // El valor por defecto de folowingUser es true

  LocationState copyWith({
    bool? isFolowingUser,
    LatLng? latKnowLocation,
    List<LatLng>? myLocationHisyory,
  }) =>
      LocationState(
        isFolowingUser: isFolowingUser ?? this.isFolowingUser,
        latKnowLocation: latKnowLocation ?? this.latKnowLocation,
        myLocationHisyory: myLocationHisyory ?? this.myLocationHisyory,
      );

  @override
  List<Object?> get props =>
      [isFolowingUser, latKnowLocation, myLocationHisyory];
}
