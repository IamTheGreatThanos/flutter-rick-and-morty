import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class GetMultipleCharacters
    extends UsecaseWithParams<List<CharacterEntity>, List<int>> {
  final CharactersRepository _charactersRepository;

  const GetMultipleCharacters(this._charactersRepository);

  @override
  ResultFuture<List<CharacterEntity>> call(List<int> params) async =>
      await _charactersRepository.getMultipleCharacters(params);
}
