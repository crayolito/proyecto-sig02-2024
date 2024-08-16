import 'package:app_sig_proyect/bloc/location/location_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/features/map/presentation/widgets/mapSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoNavigationBar extends StatefulWidget {
  const GeoNavigationBar({super.key});

  @override
  State<GeoNavigationBar> createState() => _GeoNavigationBarState();
}

class _GeoNavigationBarState extends State<GeoNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonGeoNB(
            onPressed: () {
              // mapBloc.add(OnChangedStatudFollowUser(true));

              // locationBloc.add(OnStartFolowingUser());
              // mapBloc.moveCameraMyLocation(LatLng(-17.7865983, -63.1886983));
              final userLocation = locationBloc.state.latKnowLocation;
              if (userLocation == null) return;
              mapBloc.moveCameraMyLocation(userLocation);
            },
            iconP: Icons.gps_fixed_outlined,
          ),
          ButtonGeoNB(
            onPressed: () {
              mapBloc.moveCameraTo(const LatLng(-17.7807856, -63.189542));
            },
            iconP: Icons.location_on,
          ),
          ButtonGeoNB(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return MapSettings(size: size);
                  },
                );
              },
              iconP: Icons.auto_graph_rounded)
        ],
      ),
    );
  }
}

class ButtonGeoNB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconP;
  const ButtonGeoNB({super.key, required this.onPressed, required this.iconP});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
      child: FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: Colors.white.withOpacity(.80),
        onPressed: onPressed,
        child: Icon(iconP, size: 30),
      ),
    );
  }
}
