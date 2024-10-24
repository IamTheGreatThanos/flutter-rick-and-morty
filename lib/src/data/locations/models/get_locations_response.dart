import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/src/data/locations/models/location_model.dart';
import 'package:rickandmorty/src/models/response_info_model.dart';

part 'get_locations_response.g.dart';

@JsonSerializable()
class GetLocationsResponse {
  GetLocationsResponse({required this.info, required this.results});

  final ResponseInfoModel info;
  final List<LocationModel> results;

  factory GetLocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLocationsResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GetLocationsResponseToJson(this);
}
