import 'package:flutter/material.dart';

class HeaderSecondary extends StatelessWidget {
  final String tituloCaseta;

  const HeaderSecondary({
    super.key,
    required this.sizePrincipal,
    required this.tituloCaseta,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: sizePrincipal.height * 0.12,
        width: sizePrincipal.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(
              0.0,
              4.0,
            ),
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: Text(
                tituloCaseta,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 3),
                alignment: Alignment.topLeft,
                width: sizePrincipal.width,
                child: Column(
                  children: [
                    const Text(
                      'Informacion',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 3.5,
                      width: sizePrincipal.width * 0.34,
                    )
                  ],
                ))
          ],
        ));
  }
}
