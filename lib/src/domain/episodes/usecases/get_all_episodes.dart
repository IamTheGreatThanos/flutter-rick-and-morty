import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';

class GetAllEpisodes extends UsecaseWithoutParams<GetEpisodesResponseEntity> {
  const GetAllEpisodes(this._episodeRepository);
  final EpisodeRepository _episodeRepository;
  @override
  ResultFuture<GetEpisodesResponseEntity> call() async =>
      _episodeRepository.getAllEpisodes();
}
