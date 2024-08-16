import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/container-search.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/result-search-product.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/result-search-stand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralSearchEngine extends StatelessWidget {
  const GeneralSearchEngine({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final resultSearchBloc =
    //     BlocProvider.of<ResultSearchBloc>(context, listen: true);
    final navigationBarBloc =
        BlocProvider.of<NavigationBarBloc>(context, listen: true);

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // Color(0xFF20D16A);
                // height: size.height * 0.08,
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:
                        navigationBarBloc.state.statusBar == StatuNB.product
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(
                                    0.0,
                                    1,
                                  ),
                                )
                              ]),
                child: SearchBarText(
                  sizePrincipal: size,
                ),
              ),
            ),
            Expanded(
                child: navigationBarBloc.state.statusBar == StatuNB.store
                    // Apartado de busqueda de locales especificos
                    ? const ResultSearchStand()
                    // Apartado de busqueda de (Categoria - Especifico) de productos
                    : ResultSearchProduct(size: size))
          ],
        ),
      ),
    );
  }
}
