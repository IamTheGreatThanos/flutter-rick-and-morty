part of 'character_details_bloc.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsInitial extends CharacterDetailsState {}

final class CharacterDetailsLoading extends CharacterDetailsState {}

final class CharacterDetailsLoaded extends CharacterDetailsState {
  const CharacterDetailsLoaded(
      {required this.character, required this.episodes});

  final CharacterEntity character;
  final List<EpisodeEntity> episodes;

  CharacterDetailsLoaded copyWith(
      {CharacterEntity? character, List<EpisodeEntity>? episodes}) {
    return CharacterDetailsLoaded(
        character: character ?? this.character,
        episodes: episodes ?? this.episodes);
  }

  @override
  List<Object> get props => [character, episodes];
}

final class CharacterDetailsFailure extends CharacterDetailsState {
  const CharacterDetailsFailure({this.message = "Произошла ошибка"});
  final String message;
}
