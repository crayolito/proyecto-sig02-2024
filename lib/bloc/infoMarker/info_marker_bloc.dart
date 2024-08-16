import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_marker_event.dart';
part 'info_marker_state.dart';

class InfoMarkerBloc extends Bloc<InfoMarkerEvent, InfoMarkerState> {
  InfoMarkerBloc() : super(const InfoMarkerState()) {
    on<OnChangeViewInfo>((event, emit) {
      emit(state.copyWith(viewInfo: event.viewInfo));
    });

    on<OnChangeInfoStand>((event, emit) {
      emit(state.copyWith(infoStand: event.infoStand));
    });
  }
}
