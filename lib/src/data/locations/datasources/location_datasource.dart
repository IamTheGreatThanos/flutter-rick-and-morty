import 'package:rickandmorty/src/core/rest_client/rest_client.dart';
import 'package:rickandmorty/src/data/locations/models/get_locations_response.dart';
import 'package:rickandmorty/src/data/locations/models/location_model.dart';

abstract class LocationDatasource {
  Future<GetLocationsResponse> getAllLocations();
  Future<GetLocationsResponse> getLocationsByPage(int page);
  Future<LocationModel> getLocationById(int id);
}

class LocationDatasourceImpl implements LocationDatasource {
  final RestClient _restClient;

  const LocationDatasourceImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<GetLocationsResponse> getAllLocations() async {
    return await _restClient.getAllLocations();
  }

  @override
  Future<LocationModel> getLocationById(int id) async {
    return await _restClient.getLocationById(id);
  }

  @override
  Future<GetLocationsResponse> getLocationsByPage(int page) async {
    return await _restClient.getLocationsByPage(page);
  }
}
