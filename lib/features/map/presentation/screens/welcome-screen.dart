import 'package:app_sig_proyect/bloc/gps/gps_bloc.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/map_screen2.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/permissions-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isGpsEnabled && state.isGpsPermissionGranted
              ? const MapsScreen()
              : const ScreenPermission();
        },
      ),
    );
  }
}
