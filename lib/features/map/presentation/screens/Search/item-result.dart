import 'package:flutter/material.dart';

class ItemResultSearch extends StatelessWidget {
  final Icon iconPrimary;
  final Icon iconSecundary;
  final String dataPrimary;
  final String dataSecundary;
  final GestureTapCallback? actionOnTap;

  const ItemResultSearch(
      {super.key,
      required this.iconPrimary,
      required this.iconSecundary,
      required this.dataPrimary,
      required this.dataSecundary,
      this.actionOnTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 70,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.20,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: iconPrimary,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: size.width * 0.65,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                dataPrimary,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                dataSecundary,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: actionOnTap,
                        child: Container(
                            width: size.width * 0.15,
                            alignment: Alignment.center,
                            child: iconSecundary),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
