import 'package:json_annotation/json_annotation.dart';

part 'character_location_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CharacterLocationModel {
  final String? name;
  final String? url;

  CharacterLocationModel({required this.name, required this.url});

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationModelFromJson(json);

  /// Connect the generated [_$EpisodeToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CharacterLocationModelToJson(this);
}
