import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class GetCharacters extends UsecaseWithParams<GetCharactersResponseEntity,
    GetCharactersParams> {
  const GetCharacters(this._charactersRepository);
  final CharactersRepository _charactersRepository;
  @override
  ResultFuture<GetCharactersResponseEntity> call(GetCharactersParams params) =>
      _charactersRepository.getCharacters(params.page, params.name,
          params.status, params.species, params.type, params.gender);
}

class GetCharactersParams {
  final int? page;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  GetCharactersParams(
      {this.page,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender});
}
