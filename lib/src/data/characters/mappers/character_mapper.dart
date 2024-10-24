import 'package:rickandmorty/src/data/characters/mappers/character_location_mapper.dart';
import 'package:rickandmorty/src/data/characters/models/character_model.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';

extension CharacterMapper on CharacterModel {
  CharacterEntity toEntity() {
    return CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin.toEntity(),
        location: location.toEntity(),
        image: image,
        episode: episode,
        url: url,
        created: created);
  }
}
