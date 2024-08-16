part of 'result_search_bloc.dart';

class ResultSearchEvent extends Equatable {
  const ResultSearchEvent();

  @override
  List<Object> get props => [];
}

class OnChangedStatusSearchPro extends ResultSearchEvent {
  final StatusSearchPro searchPro;
  const OnChangedStatusSearchPro(this.searchPro);
}

class OnGetProductsStand extends ResultSearchEvent {

  const OnGetProductsStand();
}

class OnGetProducts extends ResultSearchEvent {
  const OnGetProducts();
}

class OnGetStands  extends ResultSearchEvent {
  const OnGetStands();
}
