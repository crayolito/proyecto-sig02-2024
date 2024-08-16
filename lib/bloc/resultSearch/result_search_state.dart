part of 'result_search_bloc.dart';

enum StatusSearchPro { categoria, producto }

// ignore: must_be_immutable
class ResultSearchState extends Equatable {
  // LISTA INFORMACION CASETAS
  List<Stand> stands;
  List<Stand> standsAux;

  // LISTA INFORMACION PRODUCTO
  // final List<product> producto;

  // LISTA INFORMACION CATEGORIA
  // final List<categoria> categoria;

  // LISTA PRODUCTOS GENERAL
  List<Product> products;
  List<Product> productsAux;

  // LISTA PRODUCTOS DE STAND (AUX POR QUE NO DARA EL BACKEND)
  List<Product> productosAuxStand;

  final StatusSearchPro optionSearch;

  ResultSearchState(
      {this.optionSearch = StatusSearchPro.producto,
      List<Stand>? stands,
      List<Stand>? standsAux,
      List<Product>? productosAuxStand,
      List<Product>? products,
      List<Product>? productsAux})
      : products = products ?? [],
        productosAuxStand = productosAuxStand ?? [],
        stands = stands ?? [],
        standsAux = standsAux ?? [],
        productsAux = productsAux ?? [];

  ResultSearchState copyWith({
    StatusSearchPro? optionSearch,
    List<Product>? products,
    List<Product>? productsAux,
    List<Product>? productosAuxStand,
    List<Stand>? stands,
    List<Stand>? standsAux,
  }) =>
      ResultSearchState(
        optionSearch: optionSearch ?? this.optionSearch,
        standsAux: standsAux ?? this.standsAux,
        productsAux: productsAux ?? this.productsAux,
        products: products ?? this.products,
        productosAuxStand: productosAuxStand ?? this.productosAuxStand,
        stands: stands ?? this.stands,
      );

  @override
  List<Object> get props => [
        optionSearch,
        products,
        stands,
        productosAuxStand,
        productsAux,
        standsAux
      ];
}
