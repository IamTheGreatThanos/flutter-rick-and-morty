import 'package:rickandmorty/src/data/episodes/models/episode_model.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';

extension EpisodeMapper on EpisodeModel {
  EpisodeEntity toEntity() {
    return EpisodeEntity(
        id: id,
        name: name,
        air_date: air_date,
        episode: episode,
        characters: characters,
        url: url,
        created: created);
  }
}
