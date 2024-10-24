import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';

abstract class LocationRepository {
  ResultFuture<GetLocationsResponseEntity> getAllLocations();
  ResultFuture<GetLocationsResponseEntity> getLocationsByPage(int page);
  ResultFuture<LocationEntity> getLocationById(int id);
}
