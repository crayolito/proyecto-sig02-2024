import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const NavigationBarState()) {
    on<OnChangedStatusBar>((event, emit) {
      emit(state.copyWith(statusBar: event.statusBar));
    });

    on<OnChangedStatusDetailsMap>((event, emit) {
      emit(state.copyWith(detailsMap: event.statuDetailsMap));
    });

    on<OnChangedFolowTracking>((event, emit) {
      emit(state.copyWith(folowtraking: event.folowTracking));
    });
  }
}
