import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';

class GetMultipleEpisodes
    extends UsecaseWithParams<List<EpisodeEntity>, List<int>> {
  final EpisodeRepository _episodeRepository;

  const GetMultipleEpisodes(this._episodeRepository);

  @override
  ResultFuture<List<EpisodeEntity>> call(List<int> params) async =>
      await _episodeRepository.getMultipleEpisodes(params);
}
