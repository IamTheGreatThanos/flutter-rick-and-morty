import 'package:rickandmorty/src/core/entities/response_info_entity.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';

class GetLocationsResponseEntity {
  GetLocationsResponseEntity({required this.info, required this.results});

  final ResponseInfoEntity info;
  final List<LocationEntity> results;
}
