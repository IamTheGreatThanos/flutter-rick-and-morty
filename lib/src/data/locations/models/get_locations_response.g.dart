// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_locations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationsResponse _$GetLocationsResponseFromJson(
        Map<String, dynamic> json) =>
    GetLocationsResponse(
      info: ResponseInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLocationsResponseToJson(
        GetLocationsResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
