import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/src/data/characters/models/character_location_model.dart';

part 'character_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CharacterModel {
  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationModel origin; //
  final CharacterLocationModel location; //
  final String image;
  final List<String> episode; //
  final String url;
  final String created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  /// Connect the generated [_$CharacterToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
