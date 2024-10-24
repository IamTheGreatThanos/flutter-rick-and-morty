import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class GetCharacterById extends UsecaseWithParams<CharacterEntity, int> {
  const GetCharacterById(this._charactersRepository);

  final CharactersRepository _charactersRepository;

  @override
  ResultFuture<CharacterEntity> call(int params) async =>
      await _charactersRepository.getCharacterById(params);
}
