import 'package:app_sig_proyect/features/map/domain/entities/pointGeo.dart';
import 'package:app_sig_proyect/features/map/infrastructure/mappers/pointGeo-mapper.dart';

class PointsGeo {
  static List<PointGeo> convertirListStands(List<dynamic> json) {
    List<PointGeo> stands = [];

    for (var element in json) {
      final stand = PointGeoMapper.fromJson(element);
      stands.add(stand);
    }

    return stands;
  }
}