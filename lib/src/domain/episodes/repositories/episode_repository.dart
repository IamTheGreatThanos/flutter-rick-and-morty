import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';

abstract class EpisodeRepository {
  ResultFuture<GetEpisodesResponseEntity> getAllEpisodes();
  ResultFuture<GetEpisodesResponseEntity> getEpisodes(
      int? page, String? name, String? episode);
  ResultFuture<EpisodeEntity> getEpisodeById(int id);
  ResultFuture<List<EpisodeEntity>> getMultipleEpisodes(List<int> ids);
}
