import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';
import 'package:rickandmorty/src/domain/locations/repositories/location_repository.dart';

class GetLocationById extends UsecaseWithParams<LocationEntity, int> {
  const GetLocationById(this._locationRepository);
  final LocationRepository _locationRepository;

  @override
  ResultFuture<LocationEntity> call(int params) async =>
      _locationRepository.getLocationById(params);
}
