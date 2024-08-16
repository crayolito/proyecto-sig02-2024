import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/item-result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResultSearchStand extends StatelessWidget {
  const ResultSearchStand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resultSearchBloc =
        BlocProvider.of<ResultSearchBloc>(context, listen: true);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: false);

    return Column(
      children: [
        Flexible(
            child: ListView.builder(
                itemCount: resultSearchBloc.state.stands.length,
                itemBuilder: (context, index) {
                  final Stand stand = resultSearchBloc.state.stands[index];

                  return ItemResultSearch(
                      actionOnTap: () {
                        mapBloc.add(OnDrawSpecificStand(
                            stand.id, LatLng(stand.latitude, stand.longitude)));
                        infoMarkerBloc.add(OnChangeInfoStand(stand));
                        Navigator.pop(context);
                        mapBloc.moveCameraTo(
                            const LatLng(-17.7807856, -63.189542));
                      },
                      iconPrimary: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      iconSecundary: const Icon(
                        Icons.follow_the_signs,
                        color: Colors.black,
                      ),
                      dataPrimary: stand.name,
                      dataSecundary:
                          "Local #${stand.nr} | Centro Comercial Cañoto");
                }))
      ],
    );
  }
}
