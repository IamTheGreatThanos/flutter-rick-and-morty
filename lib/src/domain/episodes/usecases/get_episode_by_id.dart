import 'package:rickandmorty/src/core/usecase/usecase.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';

class GetEpisodeById extends UsecaseWithParams<EpisodeEntity, int> {
  final EpisodeRepository _episodeRepository;

  const GetEpisodeById(this._episodeRepository);

  @override
  ResultFuture<EpisodeEntity> call(int params) async =>
      _episodeRepository.getEpisodeById(params);
}
