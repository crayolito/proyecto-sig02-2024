import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final Size sizePrincipal;

  const ItemProduct({
    super.key,
    required this.product,
    required this.sizePrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(
                  -3.0,
                  4.0,
                )),
          ]),
      child: Column(
        children: [
          Container(
            height: sizePrincipal.height * 0.25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(product.image))),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 0),
            height: 74.1,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.black.withOpacity(0.3),
                    width: 2,
                  ),
                )),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${product.price} Bs",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
    //   decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(20),
    //       boxShadow: [
    //         BoxShadow(
    //             color: Colors.black.withOpacity(0.5),
    //             blurRadius: 8,
    //             offset: const Offset(
    //               -3.0,
    //               4.0,
    //             )),
    //       ]),
    //   child: Column(
    //     children: [
    //       Container(
    //         height: sizePrincipal.height * 0.25,
    //         width: sizePrincipal.width * 0.4,
    //         decoration: const BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20),
    //             topRight: Radius.circular(20),
    //           ),
    //         ),
    //         child: Container(
    //           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //           decoration: BoxDecoration(
    //               image: DecorationImage(image: NetworkImage(product.image))),
    //         ),
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         margin:
    //             const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 0),
    //         height: 74.1,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //             borderRadius: const BorderRadius.only(
    //               bottomLeft: Radius.circular(20),
    //               bottomRight: Radius.circular(20),
    //             ),
    //             border: Border(
    //               top: BorderSide(
    //                 color: Colors.black.withOpacity(0.3),
    //                 width: 2,
    //               ),
    //             )),
    //         child: Column(
    //           children: [
    //             Align(
    //                 alignment: Alignment.topLeft,
    //                 child: Text(
    //                   product.name,
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: const TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 )),
    //             Align(
    //                 alignment: Alignment.topLeft,
    //                 child: Text(
    //                   "${product.price} Bs",
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: const TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
