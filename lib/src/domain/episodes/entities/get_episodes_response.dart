import 'package:rickandmorty/src/core/entities/response_info_entity.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';

class GetEpisodesResponseEntity {
  const GetEpisodesResponseEntity({required this.info, required this.results});

  final ResponseInfoEntity info;
  final List<EpisodeEntity> results;
}
