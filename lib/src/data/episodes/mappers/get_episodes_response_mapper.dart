import 'package:rickandmorty/src/data/characters/mappers/response_info_mapper.dart';
import 'package:rickandmorty/src/data/episodes/mappers/episode_mapper.dart';
import 'package:rickandmorty/src/data/episodes/models/get_episodes_response.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';

extension GetEpisodesResponseMapper on GetEpisodesResponse {
  GetEpisodesResponseEntity toEntity() {
    return GetEpisodesResponseEntity(
        info: info.toEntity(),
        results: results.map((episode) => episode.toEntity()).toList());
  }
}
