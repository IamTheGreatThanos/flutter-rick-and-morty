import 'package:rickandmorty/src/data/characters/mappers/response_info_mapper.dart';
import 'package:rickandmorty/src/data/locations/mappers/location_mapper.dart';
import 'package:rickandmorty/src/data/locations/models/get_locations_response.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';

extension GetLocationsResponseMapper on GetLocationsResponse {
  GetLocationsResponseEntity toEntity() {
    return GetLocationsResponseEntity(
        info: info.toEntity(),
        results: results.map((el) => el.toEntity()).toList());
  }
}
