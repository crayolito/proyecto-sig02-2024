part of 'info_marker_bloc.dart';

class InfoMarkerState extends Equatable {
  final Stand? infoStand;
  final bool viewInfo;

  const InfoMarkerState({this.viewInfo = false, this.infoStand});

  InfoMarkerState copyWith({bool? viewInfo, Stand? infoStand}) =>
      InfoMarkerState(
          viewInfo: viewInfo ?? this.viewInfo,
          infoStand: infoStand ?? this.infoStand);

  @override
  List<Object?> get props => [viewInfo, infoStand];
}
