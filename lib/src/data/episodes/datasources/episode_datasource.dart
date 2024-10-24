import 'package:rickandmorty/src/core/rest_client/rest_client.dart';
import 'package:rickandmorty/src/data/episodes/models/episode_model.dart';
import 'package:rickandmorty/src/data/episodes/models/get_episodes_response.dart';

abstract class EpisodeDatasource {
  Future<GetEpisodesResponse> getAllEpisodes();
  Future<GetEpisodesResponse> getEpisodes(
      int? page, String? name, String? episode);
  Future<EpisodeModel> getEpisodeById(int id);
  Future<List<EpisodeModel>> getMultipleEpisodes(List<int> ids);
}

class EpisodeDatasourceImpl implements EpisodeDatasource {
  const EpisodeDatasourceImpl(this._restClient);

  final RestClient _restClient;

  @override
  Future<EpisodeModel> getEpisodeById(int id) async {
    return await _restClient.getEpisodeById(id);
  }

  @override
  Future<List<EpisodeModel>> getMultipleEpisodes(List<int> ids) async {
    return await _restClient.getMultipleEpisodes(ids);
  }

  @override
  Future<GetEpisodesResponse> getAllEpisodes() async {
    return await _restClient.getAllEpisodes();
  }

  @override
  Future<GetEpisodesResponse> getEpisodes(
      int? page, String? name, String? episode) async {
    return await _restClient.getEpisodes(page, name, episode);
  }
}
