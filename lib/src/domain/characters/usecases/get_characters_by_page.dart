import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class GetCharactersByPage
    extends UsecaseWithParams<GetCharactersResponseEntity, int> {
  const GetCharactersByPage(this._charactersRepository);
  final CharactersRepository _charactersRepository;
  @override
  ResultFuture<GetCharactersResponseEntity> call(int params) async =>
      _charactersRepository.getCharactersByPage(params);
}
