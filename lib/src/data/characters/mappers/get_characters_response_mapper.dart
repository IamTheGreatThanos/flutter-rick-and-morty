import 'package:rickandmorty/src/data/characters/mappers/character_mapper.dart';
import 'package:rickandmorty/src/data/characters/mappers/response_info_mapper.dart';
import 'package:rickandmorty/src/data/characters/models/get_characters_response.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';

extension GetCharactersResponseMapper on GetCharactersResponse {
  GetCharactersResponseEntity toEntity() {
    return GetCharactersResponseEntity(
        info: info.toEntity(),
        results: results.map((el) => el.toEntity()).toList());
  }
}
