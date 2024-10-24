// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_characters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCharactersResponse _$GetCharactersResponseFromJson(
        Map<String, dynamic> json) =>
    GetCharactersResponse(
      info: ResponseInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCharactersResponseToJson(
        GetCharactersResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
