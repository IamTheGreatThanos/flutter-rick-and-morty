import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class GetAllCharacters
    extends UsecaseWithoutParams<GetCharactersResponseEntity> {
  const GetAllCharacters(this._charactersRepository);

  final CharactersRepository _charactersRepository;

  @override
  ResultFuture<GetCharactersResponseEntity> call() async =>
      _charactersRepository.getAllCharacters();
}
