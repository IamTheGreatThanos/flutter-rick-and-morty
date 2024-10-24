import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';

class GetEpisodes
    extends UsecaseWithParams<GetEpisodesResponseEntity, GetEpisodesParams> {
  const GetEpisodes(this._episodeRepository);
  final EpisodeRepository _episodeRepository;
  @override
  ResultFuture<GetEpisodesResponseEntity> call(
          GetEpisodesParams params) async =>
      _episodeRepository.getEpisodes(params.page, params.name, params.episode);
}

class GetEpisodesParams {
  final int? page;
  final String? name;
  final String? episode;

  GetEpisodesParams({this.page, this.name, this.episode});
}
