import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:flutter/material.dart';

class ViewProductScreen extends StatelessWidget {
  final Product product;
  final VoidCallback? onPressed;
  const ViewProductScreen({super.key, required this.product, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            )),
        actions: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageProduct(
              size: size,
              imageProducto: product.image,
            ),
            DetailsProduct(
              size: size,
              nombreProducto: product.name,
              descripcionProducto: product.description,
              descuentoProducto: product.discount,
              precioProducto: product.price,
            )
          ],
        ),
      ),
    );
  }
}

class DetailsProduct extends StatelessWidget {
  final String nombreProducto;
  final String descripcionProducto;
  final double precioProducto;
  final int descuentoProducto;

  const DetailsProduct({
    super.key,
    required this.size,
    required this.nombreProducto,
    required this.descripcionProducto,
    required this.precioProducto,
    required this.descuentoProducto,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.407,
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            width: size.width * 0.25,
            height: size.height * 0.0058,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: size.width,
            height: (size.height * 0.407) * 0.87,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    nombreProducto,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tamaños",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const DifferentSizes(),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Descripcion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    descripcionProducto,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text("Precio: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text("${precioProducto}bs ",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 20)),
                    const Text("- Promocion: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text("$descuentoProducto%",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 20)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DifferentSizes extends StatelessWidget {
  const DifferentSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("XS",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("XL",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("L",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("S",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ],
    );
  }
}

class ImageProduct extends StatelessWidget {
  final String imageProducto;

  const ImageProduct({
    super.key,
    required this.size,
    required this.imageProducto,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.50,
      width: size.width,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 35, right: 35, top: 5, bottom: 25),
        height: size.height * 0.50,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageProducto), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
