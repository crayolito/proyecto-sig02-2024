import 'package:app_sig_proyect/bloc/gps/gps_bloc.dart';
import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/location/location_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:app_sig_proyect/config/constants/enviroment.dart';
import 'package:app_sig_proyect/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // runApp(const MyApp());
  await Environment.initEnvironment();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GpsBloc(),
      ),
      BlocProvider(
        create: (context) => NavigationBarBloc(),
      ),
      BlocProvider(
        create: (context) => InfoMarkerBloc(),
      ),
      BlocProvider(
        create: (context) => LocationBloc(),
      ),
      BlocProvider(
        create: (context) => MapBloc(
            navigationBarBloc: BlocProvider.of<NavigationBarBloc>(context),
            locationBloc: BlocProvider.of<LocationBloc>(context),
            infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(context)),
      ),
      BlocProvider(
        create: (context) => ResultSearchBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
