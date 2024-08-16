import 'package:app_sig_proyect/features/map/presentation/screens/WindowInfo/routeAddressing-widget.dart';
import 'package:flutter/material.dart';

class BodyWindown extends StatelessWidget {
  final String nrStand;
  final String owner;
  final String imagen;
  final String direction;
  final String phone;

  const BodyWindown({
    super.key,
    required this.sizePrincipal,
    required this.owner,
    required this.imagen,
    required this.direction,
    required this.phone,
    required this.nrStand,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizePrincipal.height * 0.72,
      width: sizePrincipal.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sizePrincipal.height * 0.40,
              width: sizePrincipal.width,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imagen), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.all(20),
              ),
            ),
            Container(
              // height: sizePrincipal.height,
              width: sizePrincipal.width,
              child: Column(
                children: [
                  const Divider(color: Colors.black),
                  InformationSection(
                    data: direction,
                    icon: Icons.location_on_outlined,
                  ),
                  const Divider(color: Colors.black),
                  const InformationSection(
                    data: "Hora de apertura: 8:00 am - 8:00 pm",
                    icon: Icons.watch_later_outlined,
                  ),
                  const Divider(color: Colors.black),
                  InformationSection(
                    data: owner,
                    icon: Icons.person,
                  ),
                  const Divider(color: Colors.black),
                  InformationSection(
                    data: phone,
                    icon: Icons.phone,
                  ),
                  const Divider(color: Colors.black),
                  RouteAddressing(
                      sizePrincipal: sizePrincipal, nrStand: nrStand),
                  const Divider(color: Colors.black),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 6, horizontal: sizePrincipal.width * 0.20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/standProductSearch');
                      },
                      child: const InformationSection(
                          data: "Ver Productos",
                          icon: Icons.remove_red_eye_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationSection extends StatelessWidget {
  final String data;
  final IconData icon;
  const InformationSection({
    super.key,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            icon,
            size: 35,
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            data,
            style: const TextStyle(fontSize: 20),
          ),
        ))
      ],
    );
  }
}
