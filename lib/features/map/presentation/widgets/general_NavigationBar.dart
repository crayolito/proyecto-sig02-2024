import 'package:app_sig_proyect/bloc/navigationBar/navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PbottomNavigationBar extends StatefulWidget {
  const PbottomNavigationBar({super.key});

  @override
  State<PbottomNavigationBar> createState() => _PbottomNavigationBarState();
}

class _PbottomNavigationBarState extends State<PbottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigationBarBloc = BlocProvider.of<NavigationBarBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.90),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
              onPressed: () {
                navigationBarBloc
                    .add(const OnChangedStatusBar(StatuNB.product));
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 35,
              )),
          IconButton(
              onPressed: () {
                navigationBarBloc.add(const OnChangedStatusBar(StatuNB.store));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 35,
              )),
          IconButton(
              onPressed: () {
                navigationBarBloc.add(const OnChangedStatusBar(StatuNB.gps));
              },
              icon: const Icon(
                Icons.gps_fixed,
                size: 35,
              )),
        ]),
      ),
    );
  }
}
