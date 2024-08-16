import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapVieww extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Polygon> polygons;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  const MapVieww({
    super.key,
    required this.initialLocation,
    required this.polygons,
    required this.markers,
    required this.polylines,
  });

  @override
  State<MapVieww> createState() => _MapViewwState();
}

class _MapViewwState extends State<MapVieww> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);
    final CameraPosition initialCameraPosition = CameraPosition(
      target: widget.initialLocation,
      zoom: 17,
    );

    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          onPointerMove: (pointerMoveEvent) => {
            mapBloc.add(const OnChangedStatudFollowUser(false)),
          },
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled:
                false, // Desactiva la barra de herramientas del mapa
            buildingsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              mapBloc.add(OnMapInitialControllerMap(controller));
            },
            // TODO: Markers
            markers: widget.markers,
            // TODO: Polygons
            polygons: widget.polygons,
            // TODO: Polylines
            polylines: widget.polylines,
          ),
        ));
  }
}
