import 'package:flutter/material.dart';

class SearchBarText extends StatelessWidget {
  final Size sizePrincipal;
  const SearchBarText({
    super.key,
    required this.sizePrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Buscar Aqui ...',
                  hintStyle: TextStyle(fontSize: 20)),
            ),
          )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear_rounded,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
    );
  }
}
