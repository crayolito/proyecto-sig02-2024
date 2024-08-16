part of 'info_marker_bloc.dart';

class InfoMarkerEvent extends Equatable {
  const InfoMarkerEvent();

  @override
  List<Object> get props => [];
}

class OnChangeViewInfo extends InfoMarkerEvent {
  final bool viewInfo;
  const OnChangeViewInfo(this.viewInfo);
}

class OnChangeInfoStand extends InfoMarkerEvent {
  final Stand infoStand;
  const OnChangeInfoStand(this.infoStand);
}
