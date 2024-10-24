import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';

abstract interface class CharactersRepository {
  ResultFuture<GetCharactersResponseEntity> getAllCharacters();
  ResultFuture<GetCharactersResponseEntity> getCharacters(
      int? page,
      String? name,
      String? status,
      String? species,
      String? type,
      String? gender);
  ResultFuture<GetCharactersResponseEntity> getCharactersByPage(int page);
  ResultFuture<List<CharacterEntity>> getMultipleCharacters(List<int> ids);
  ResultFuture<CharacterEntity> getCharacterById(int id);
}
