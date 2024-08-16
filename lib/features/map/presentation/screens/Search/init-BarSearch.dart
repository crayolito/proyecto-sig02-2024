import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:app_sig_proyect/bloc/resultSearch/result_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarSearch extends StatelessWidget {
  final Size sizePadre;
  const BarSearch({super.key, required this.sizePadre});

  @override
  Widget build(BuildContext context) {
    final navigationBarBloc =
        BlocProvider.of<NavigationBarBloc>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/generalSearch');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: sizePadre.width,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.90),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                size: 35,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 8),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 2))),
                    child: Text(
                      navigationBarBloc.state.statusBar == StatuNB.product
                          ? 'Producto ...'
                          : 'Tienda ...',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
