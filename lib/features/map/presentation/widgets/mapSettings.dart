import 'package:animate_do/animate_do.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapSettings extends StatelessWidget {
  const MapSettings({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.40,
              ),
              Container(
                height: size.height * 0.561,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    // TITULO Y OPCION CERRAR
                    TitleDetailsP1(size: size),
                    // OPCIONES DETALLES MAPA PARTE 1
                    const DetailsOpcionsP1(),
                    // DIVIDER
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Divider(
                          thickness: 3,
                        )),
                    // TITULO 2
                    const TitleDetailsP2(),
                    // OPCIONES DETALLES
                    const DetailsOpcions(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class DetailsOpcions extends StatelessWidget {
  const DetailsOpcions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationBarBloc =
        BlocProvider.of<NavigationBarBloc>(context, listen: true);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionToModifyMap(
              imagen: "assets/tracking.png",
              onTap: () {
                navigationBarBloc.add(OnChangedFolowTracking(
                    !navigationBarBloc.state.folowtraking));
                mapBloc.add(OnToggleUserRoute());
              },
              statusMap: navigationBarBloc.state.folowtraking == true,
              message: "Tracking")
        ],
      ),
    );
  }
}

class TitleDetailsP2 extends StatelessWidget {
  const TitleDetailsP2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, right: 4, top: 10),
        width: double.infinity,
        child: const Text('Detalles Gps'));
  }
}

class DetailsOpcionsP1 extends StatelessWidget {
  const DetailsOpcionsP1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationBarBloc =
        BlocProvider.of<NavigationBarBloc>(context, listen: true);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionToModifyMap(
            statusMap:
                navigationBarBloc.state.detailsMap == StatuDetailsMap.pasillo,
            imagen: "assets/calle.png",
            message: "Pasillos",
            onTap: () {
              mapBloc.add(const OnCleanTerrainMap());
              navigationBarBloc.add(
                  const OnChangedStatusDetailsMap(StatuDetailsMap.pasillo));
              mapBloc.add(const OnChangeTerrainMap());
            },
          ),
          OptionToModifyMap(
            statusMap:
                navigationBarBloc.state.detailsMap == StatuDetailsMap.caseta,
            imagen: "assets/casetas.png",
            message: "Casetas",
            onTap: () {
              mapBloc.add(const OnCleanTerrainMap());
              navigationBarBloc
                  .add(const OnChangedStatusDetailsMap(StatuDetailsMap.caseta));
              mapBloc.add(const OnChangeTerrainMap());
            },
          ),
          OptionToModifyMap(
            statusMap:
                navigationBarBloc.state.detailsMap == StatuDetailsMap.entrada,
            imagen: "assets/entrada.png",
            message: "Entradas",
            onTap: () {
              mapBloc.add(const OnCleanTerrainMap());
              navigationBarBloc.add(
                  const OnChangedStatusDetailsMap(StatuDetailsMap.entrada));
              mapBloc.add(const OnChangeTerrainMap());
            },
          ),
        ],
      ),
    );
  }
}

class OptionToModifyMap extends StatelessWidget {
  final String imagen;
  final GestureTapCallback onTap;
  final bool statusMap;
  final String message;

  const OptionToModifyMap({
    super.key,
    required this.imagen,
    required this.onTap,
    required this.statusMap,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: statusMap
                            ? Color.fromARGB(255, 0, 199, 83)
                            : Colors.transparent,
                        width: 4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(image: AssetImage(imagen))),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                message,
                style: TextStyle(
                    color: statusMap
                        ? Color.fromARGB(255, 0, 199, 83)
                        : Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TitleDetailsP1 extends StatelessWidget {
  const TitleDetailsP1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 4, top: 15),
      width: double.infinity,
      height: (size.height * 0.62) * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Detalle en Mapa Guia'),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear))
        ],
      ),
    );
  }
}
