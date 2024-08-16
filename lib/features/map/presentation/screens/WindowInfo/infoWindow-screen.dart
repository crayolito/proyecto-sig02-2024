import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/body-window.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/footer-primary.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/header-primary.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/header-secondary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WindoInfoCaseta extends StatelessWidget {
  const WindoInfoCaseta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);

    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scroolController) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                controller: scroolController,
                child: Column(
                  children: [
                    HeaderPrimary(sizePrincipal: size),
                    HeaderSecondary(
                      sizePrincipal: size,
                      tituloCaseta: infoMarkerBloc.state.infoStand!.name,
                    ),
                    BodyWindown(
                      sizePrincipal: size,
                      nrStand: infoMarkerBloc.state.infoStand!.nr,
                      owner: infoMarkerBloc.state.infoStand!.owner,
                      imagen: infoMarkerBloc.state.infoStand!.image,
                      phone: "+591 78452415",
                      direction: infoMarkerBloc.state.infoStand!.direction,
                    ),
                    FooterPrimary(sizePrincipal: size)
                  ],
                ),
              ));
        });
  }
}
