import 'package:app_sig_proyect/data/producto-data.dart';
import 'package:app_sig_proyect/features/map/domain/entities/producto.dart';
import 'package:app_sig_proyect/features/map/domain/entities/productos.dart';
import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:app_sig_proyect/features/map/infrastructure/repositories/stand_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'result_search_event.dart';
part 'result_search_state.dart';

class ResultSearchBloc extends Bloc<ResultSearchEvent, ResultSearchState> {
  final standRepositoryImpl = StandRepositoryImpl();

  ResultSearchBloc() : super(ResultSearchState()) {
    on<OnChangedStatusSearchPro>((event, emit) {
      emit(state.copyWith(optionSearch: event.searchPro));
    });

    on<OnGetProductsStand>((event, emit) {
      final response = Products.convertirListPointsRouteGeo(DataProducts);
      emit(state.copyWith(productosAuxStand: response));
    });

    on<OnGetProducts>((event, emit) async {
      try {
        final response = await standRepositoryImpl.getProducts();
        emit(state.copyWith(
          products: response,
          productsAux: response,
        ));
      } catch (e) {
        print('Error: $e');
        throw Exception();
      }
    });

    on<OnGetStands>(_onGetStands);
  }

  Future<void> _onGetStands(
      OnGetStands event, Emitter<ResultSearchState> emit) async {
    try {
      final response = await standRepositoryImpl.getStands();
      emit(state.copyWith(stands: response, standsAux: response));
    } catch (e) {
      print('Error: $e');
      throw Exception();
    }
  }
}
