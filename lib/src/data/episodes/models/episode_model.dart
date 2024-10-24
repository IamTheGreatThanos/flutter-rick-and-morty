import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  EpisodeModel(
      {required this.id,
      required this.name,
      required this.air_date,
      required this.episode,
      required this.characters,
      required this.url,
      required this.created});

  final int id;
  final String name;
  final String air_date;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  /// Connect the generated [_$EpisodeToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
