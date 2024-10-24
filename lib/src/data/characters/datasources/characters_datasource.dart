import 'package:rickandmorty/src/core/rest_client/rest_client.dart';
import 'package:rickandmorty/src/data/characters/models/character_model.dart';
import 'package:rickandmorty/src/data/characters/models/get_characters_response.dart';

abstract class CharactersDatasource {
  Future<GetCharactersResponse> getAllCharacters();
  Future<GetCharactersResponse> getCharacters(int? page, String? name,
      String? status, String? species, String? type, String? gender);
  Future<GetCharactersResponse> getCharactersByPage(int page);
  Future<List<CharacterModel>> getMultipleCharacters(List<int> ids);
  Future<CharacterModel> getCharacterById(int id);
}

class CharactersDatasourceImpl implements CharactersDatasource {
  const CharactersDatasourceImpl(this._restClient);

  final RestClient _restClient;

  @override
  Future<GetCharactersResponse> getAllCharacters() async {
    final response = await _restClient.getAllCharacters();

    return response;
  }

  @override
  Future<GetCharactersResponse> getCharactersByPage(int page) async {
    return await _restClient.getCharactersByPage(page);
  }

  @override
  Future<CharacterModel> getCharacterById(int id) async {
    return await _restClient.getCharacterById(id);
  }

  @override
  Future<List<CharacterModel>> getMultipleCharacters(List<int> ids) async {
    return await _restClient.getMultipleCharacters(ids);
  }

  @override
  Future<GetCharactersResponse> getCharacters(int? page, String? name,
      String? status, String? species, String? type, String? gender) async {
    return await _restClient.getCharacters(
        page, name, status, species, type, gender);
  }
}
