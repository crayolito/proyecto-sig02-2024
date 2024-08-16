part of 'navigation_bar_bloc.dart';

class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();

  @override
  List<Object> get props => [];
}

class OnChangedStatusBar extends NavigationBarEvent {
  final StatuNB statusBar;
  const OnChangedStatusBar(this.statusBar);
}

class OnChangedStatusDetailsMap extends NavigationBarEvent {
  final StatuDetailsMap statuDetailsMap;
  const OnChangedStatusDetailsMap(this.statuDetailsMap);
}

class OnChangedFolowTracking extends NavigationBarEvent {
  final bool folowTracking;
  const OnChangedFolowTracking(this.folowTracking);
}
