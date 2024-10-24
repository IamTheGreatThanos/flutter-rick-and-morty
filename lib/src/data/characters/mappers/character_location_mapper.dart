import 'package:rickandmorty/src/data/characters/models/character_location_model.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_location_entity.dart';

extension CharacterLocationMapper on CharacterLocationModel {
  CharacterLocationEntity toEntity() {
    return CharacterLocationEntity(name: name ?? "", url: url ?? "");
  }
}
