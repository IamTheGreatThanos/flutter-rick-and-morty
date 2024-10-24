import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/src/data/episodes/models/episode_model.dart';
import 'package:rickandmorty/src/models/response_info_model.dart';

part 'get_episodes_response.g.dart';

@JsonSerializable()
class GetEpisodesResponse {
  GetEpisodesResponse({required this.info, required this.results});

  final ResponseInfoModel info;
  final List<EpisodeModel> results;

  factory GetEpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEpisodesResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GetEpisodesResponseToJson(this);
}
