import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';
import 'package:rickandmorty/src/domain/locations/repositories/location_repository.dart';

class GetAllLocations extends UsecaseWithoutParams<GetLocationsResponseEntity> {
  const GetAllLocations(this._locationRepository);

  final LocationRepository _locationRepository;

  @override
  ResultFuture<GetLocationsResponseEntity> call() async =>
      _locationRepository.getAllLocations();
}
