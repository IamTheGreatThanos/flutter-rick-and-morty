import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';
import 'package:rickandmorty/src/domain/locations/repositories/location_repository.dart';

class GetLocationsByPage
    extends UsecaseWithParams<GetLocationsResponseEntity, int> {
  const GetLocationsByPage(this._locationRepository);

  final LocationRepository _locationRepository;
  @override
  ResultFuture<GetLocationsResponseEntity> call(int params) async =>
      _locationRepository.getLocationsByPage(params);
}
