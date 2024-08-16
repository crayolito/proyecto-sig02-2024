import 'package:animate_do/animate_do.dart';
import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/location/location_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/infoWindow-screen.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/map_view2.dart';
import 'package:app_sig_proyect/features/map/presentation/widgets/general_NavigationBar.dart';
import 'package:app_sig_proyect/features/map/presentation/widgets/geo_NavigationBar.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/init-BarSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LocationBloc? locationBloc;
  @override
  void initState() {
    super.initState();
    final locationBloc = BlocProvider.of<LocationBloc>(context);

    locationBloc.startFollowingUser();

    final mapBloc = BlocProvider.of<MapBloc>(context);
    //
    final resultSearchEvent = BlocProvider.of<ResultSearchBloc>(context);
    resultSearchEvent.add(const OnGetProductsStand());
    //
    mapBloc.add(const OnInitialFigures());
    mapBloc.add(const OnChangeTerrainMap());

    final resultSearchBloc = BlocProvider.of<ResultSearchBloc>(context);
    resultSearchBloc.add(const OnGetStands());
    resultSearchBloc.add(const OnGetProducts());
    resultSearchBloc.add(const OnGetProductsStand());
  }

  @override
  void dispose() {
    locationBloc!.stopFolowwingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationBarBloc = BlocProvider.of<NavigationBarBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
      if (locationState.latKnowLocation == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Stack(
        children: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polyliness = Map.from(mapState.polylines);
              if (!mapState.showMyRoute) {
                polyliness.removeWhere((key, value) => key == 'myRoute');
              }

              return MapVieww(
                initialLocation: locationState.latKnowLocation!,
                polylines: polyliness.values.toSet(),
                polygons: mapState.polygons.values.toSet(),
                markers: mapState.markers.values.toSet(),
              );
            },
          ),

          // PARTE: SUPERIOR
          BlocBuilder<NavigationBarBloc, NavigationBarState>(
            builder: (context, state) {
              if (navigationBarBloc.state.statusBar == StatuNB.product ||
                  navigationBarBloc.state.statusBar == StatuNB.store) {
                return SafeArea(
                  child: FadeInDown(
                    child: BarSearch(
                      sizePadre: size,
                    ),
                  ),
                );
              }
              return SafeArea(
                child: FadeInDown(
                  child: IconButton(
                      onPressed: () {
                        navigationBarBloc
                            .add(const OnChangedStatusBar(StatuNB.product));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 35,
                      )),
                ),
              );
            },
          ),
          // PARTE : INFERIOR
          BlocBuilder<NavigationBarBloc, NavigationBarState>(
            builder: (context, state) {
              if ((navigationBarBloc.state.statusBar == StatuNB.product ||
                  navigationBarBloc.state.statusBar == StatuNB.store)) {
                return Positioned(
                    top: size.height * 0.92,
                    left: size.width * .25,
                    child: FadeInUp(child: const PbottomNavigationBar()));
              }
              return FadeInRight(child: const GeoNavigationBar());
            },
          ),
          // INFORMACION DE CASETA
          BlocBuilder<InfoMarkerBloc, InfoMarkerState>(
            builder: (context, state) {
              if (state.viewInfo) {
                return FadeInUp(child: const WindoInfoCaseta());
              }
              return Container();
            },
          )
        ],
      );
    });
  }
}
