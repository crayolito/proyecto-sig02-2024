import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:app_sig_proyect/data/producto-data.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/productStand/item-product.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/productStand/view-product-screen.dart';
import 'package:flutter/material.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/container-search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsStand extends StatelessWidget {
  const SearchProductsStand({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(size: size),
          const BodyContainer(),
        ],
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resultSearchBloc =
        BlocProvider.of<ResultSearchBloc>(context, listen: true);

    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: resultSearchBloc.state.productosAuxStand.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: size.height * 0.37,
        ),
        itemBuilder: (context, index) {
          final sizePost = MediaQuery.of(context).size;
          final producto = resultSearchBloc.state.productosAuxStand[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProductScreen(
                              product: producto,
                            )));
              },
              child: ItemProduct(product: producto, sizePrincipal: sizePost));
        },
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
    );
  }
}
