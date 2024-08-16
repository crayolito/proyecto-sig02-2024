import 'package:app_sig_proyect/features/map/domain/entities/stand.dart';
import 'package:app_sig_proyect/features/map/infrastructure/mappers/stand_mapper.dart';

class Stands {
  static List<Stand> convertirListStands(List<dynamic> json) {
    List<Stand> stands = [];

    for (var element in json) {
      final stand = StandMapper.fromJson(element);
      stands.add(stand);
    }

    return stands;
  }
}
