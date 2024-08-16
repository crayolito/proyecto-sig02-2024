part of 'navigation_bar_bloc.dart';

enum StatuNB { product, store, gps }

enum StatuDetailsMap { pasillo, caseta, entrada, completo }

class NavigationBarState extends Equatable {
  final StatuNB statusBar;

  final StatuDetailsMap detailsMap;

  final bool folowtraking;

  const NavigationBarState(
      {this.statusBar = StatuNB.product,
      this.detailsMap = StatuDetailsMap.caseta,
      // this.detailsMap = StatuDetailsMap.entrada,
      // this.detailsMap = StatuDetailsMap.pasillo,
      this.folowtraking = false});

  NavigationBarState copyWith(
          {StatuNB? statusBar,
          StatuDetailsMap? detailsMap,
          bool? folowtraking}) =>
      NavigationBarState(
          statusBar: statusBar ?? this.statusBar,
          detailsMap: detailsMap ?? this.detailsMap,
          folowtraking:
              folowtraking ?? this.folowtraking); // Corregir esta línea

  @override
  List<Object> get props => [statusBar, detailsMap, folowtraking];
}
