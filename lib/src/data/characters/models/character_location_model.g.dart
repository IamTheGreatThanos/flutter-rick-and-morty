// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterLocationModel _$CharacterLocationModelFromJson(
        Map<String, dynamic> json) =>
    CharacterLocationModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CharacterLocationModelToJson(
    CharacterLocationModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('url', instance.url);
  return val;
}
