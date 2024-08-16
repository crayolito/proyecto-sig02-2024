import 'package:app_sig_proyect/bloc/infoMarker/info_marker_bloc.dart';
import 'package:app_sig_proyect/bloc/map/map_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/item-result.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/productStand/view-product-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResultSearchProduct extends StatelessWidget {
  const ResultSearchProduct({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // final resultSearchBloc =
    //     BlocProvider.of<ResultSearchBloc>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          // HeaderContainer(sizePrincipal: size),
          BodyContainer(sizePrincipal: size)
        ],
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
    required this.sizePrincipal,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);
    final resultSearchBloc =
        BlocProvider.of<ResultSearchBloc>(context, listen: true);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      height: (sizePrincipal.height * 0.92) * 0.9,
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: resultSearchBloc.state.products.length,
              itemBuilder: (context, index) {
                final producto = resultSearchBloc.state.products[index];
                return resultSearchBloc.state.optionSearch ==
                        StatusSearchPro.categoria
                    ? const ItemResultSearch(
                        dataPrimary: 'Producto General',
                        dataSecundary: 'Cantidad Locales con este',
                        iconPrimary: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        iconSecundary: Icon(
                          Icons.add_location_alt_outlined,
                          color: Colors.black,
                        ),
                      )
                    : GestureDetector(
                        child: ItemResultSearch(
                          dataPrimary: producto.name,
                          dataSecundary: producto.description,
                          actionOnTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewProductScreen(
                                        product: producto,
                                        onPressed: () {
                                          final infoStand = Stand(
                                              id: 1,
                                              name: "El mundo de Gooblan",
                                              owner: "Ricky Snachez",
                                              image:
                                                  "https://fastly.4sqi.net/img/general/600x600/65860225_nEw2YDZYf-iWBgBZ6mG_akJvIs4jGPDd2rmjpfrvlS0.jpg",
                                              direction:
                                                  "Centro Comercial Cañoto | Local #55A",
                                              longitude: -17.78091547,
                                              latitude: -63.18956431,
                                              nr: "55A",
                                              phone: " +591 67756537",
                                              urlPage: "ww.asdas  ",
                                              createdAt: DateTime.now());
                                          infoMarkerBloc.add(
                                              OnChangeInfoStand(infoStand));
                                          mapBloc.moveCameraToPersonalized(
                                              const LatLng(
                                                  -17.78091547, -63.18956431));
                                          mapBloc.add(const OnDrawStandFake());
                                          Navigator.pop(context);
                                        },
                                      )),
                            );
                          },
                          iconPrimary: const Icon(
                            Icons.auto_awesome_motion_outlined,
                            color: Colors.white,
                          ),
                          iconSecundary: const Icon(
                            Icons.follow_the_signs,
                            color: Colors.black,
                          ),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.sizePrincipal,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    final resultSearchBloc =
        BlocProvider.of<ResultSearchBloc>(context, listen: true);
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: (sizePrincipal.height * 0.90) * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 1,
          offset: const Offset(
            0.0,
            2,
          ),
        )
      ], color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OptionsView(
            message: "Categoria",
            status: resultSearchBloc.state.optionSearch ==
                StatusSearchPro.categoria,
            onTap: () {
              resultSearchBloc.add(
                  const OnChangedStatusSearchPro(StatusSearchPro.categoria));
            },
          ),
          const SizedBox(
            width: 30,
          ),
          OptionsView(
            message: "Especifico",
            status:
                resultSearchBloc.state.optionSearch == StatusSearchPro.producto,
            onTap: () {
              resultSearchBloc.add(
                  const OnChangedStatusSearchPro(StatusSearchPro.producto));
            },
          )
        ],
      ),
    );
  }
}

class OptionsView extends StatelessWidget {
  final String message;
  final bool status;
  final GestureTapCallback? onTap;

  const OptionsView({
    super.key,
    required this.message,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                color: status ? const Color(0xFF20D16A) : Colors.black,
                width: 3)),
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
