import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteAddressing extends StatelessWidget {
  final String nrStand;

  const RouteAddressing({
    super.key,
    required this.sizePrincipal,
    required this.nrStand,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: false);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: (sizePrincipal.height * 0.60) * 0.20,
        width: sizePrincipal.width,
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.timeline_sharp,
                      size: 35,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Direccionamiento',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputButton(
                  entrada: "A",
                  onPressed: () {
                    mapBloc.add(OnDrawStandGeoRoute(
                        nrStand: nrStand, nameEntrance: "A"));
                    mapBloc.moveCameraToPersonalized(
                        const LatLng(-17.78041643, -63.18985579));
                    infoMarkerBloc
                        .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                    // Tu código aquí...
                  },
                ),
                InputButton(
                  entrada: "G",
                  onPressed: () {
                    mapBloc.add(OnDrawStandGeoRoute(
                        nrStand: nrStand, nameEntrance: "G"));
                    mapBloc.moveCameraToPersonalized(
                        const LatLng(-17.78033721, -63.18946992));
                    infoMarkerBloc
                        .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                    // Tu código aquí...
                  },
                ),
                InputButton(
                  entrada: "C",
                  onPressed: () {
                    mapBloc.add(OnDrawStandGeoRoute(
                        nrStand: nrStand, nameEntrance: "C"));
                    mapBloc.moveCameraToPersonalized(
                        const LatLng(-17.78102462, -63.18914766));
                    infoMarkerBloc
                        .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                    // Tu código aquí...
                  },
                ),
                InputButton(
                  entrada: "E",
                  onPressed: () {
                    mapBloc.add(OnDrawStandGeoRoute(
                        nrStand: nrStand, nameEntrance: "E"));
                    mapBloc.moveCameraToPersonalized(
                        const LatLng(-17.7810289, -63.18990433));
                    infoMarkerBloc
                        .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                    // Tu código aquí...
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

class InputButton extends StatelessWidget {
  final String entrada;
  final VoidCallback? onPressed;

  const InputButton({
    super.key,
    this.onPressed,
    required this.entrada,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<CircleBorder>(
          const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onPressed,
      child: Text(
        entrada,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
