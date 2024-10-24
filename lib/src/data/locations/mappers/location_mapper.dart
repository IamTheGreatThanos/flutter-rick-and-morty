import 'package:rickandmorty/src/data/locations/models/location_model.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';

extension LocationMapper on LocationModel {
  LocationEntity toEntity() {
    return LocationEntity(
        id: id,
        name: name,
        type: type,
        dimension: dimension,
        residents: residents,
        url: url,
        created: created);
  }
}
