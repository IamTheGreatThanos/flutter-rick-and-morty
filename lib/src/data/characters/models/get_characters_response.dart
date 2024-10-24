import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/src/data/characters/models/character_model.dart';
import 'package:rickandmorty/src/models/response_info_model.dart';

part 'get_characters_response.g.dart';

@JsonSerializable()
class GetCharactersResponse {
  final ResponseInfoModel info;
  final List<CharacterModel> results;

  GetCharactersResponse({required this.info, required this.results});

  factory GetCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCharactersResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GetCharactersResponseToJson(this);
}
