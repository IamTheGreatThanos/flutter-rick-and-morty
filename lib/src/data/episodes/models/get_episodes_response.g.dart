// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_episodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEpisodesResponse _$GetEpisodesResponseFromJson(Map<String, dynamic> json) =>
    GetEpisodesResponse(
      info: ResponseInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetEpisodesResponseToJson(
        GetEpisodesResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
