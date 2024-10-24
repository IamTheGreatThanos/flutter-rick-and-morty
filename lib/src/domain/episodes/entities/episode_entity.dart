class EpisodeEntity {
  EpisodeEntity(
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
}
