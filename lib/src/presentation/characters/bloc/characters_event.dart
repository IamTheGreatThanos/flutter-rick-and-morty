part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

final class CharactersGetAllEvent extends CharactersEvent {}

final class CharactersGetEvent extends CharactersEvent {
  const CharactersGetEvent({
    this.page,
    this.status,
    this.gender,
  });

  final int? page;
  final String? status;
  final String? gender;

  @override
  List<Object> get props => [
        page ?? 0,
        status ?? '',
        gender ?? '',
      ];
}

final class CharactersGetNextPageEvent extends CharactersEvent {}

final class CharactersUpdateFiltersEvent extends CharactersEvent {
  const CharactersUpdateFiltersEvent({
    this.status,
    this.gender,
  });

  final String? status;
  final String? gender;

  @override
  List<Object> get props => [
        status ?? '',
        gender ?? '',
      ];
}

final class CharactersClearFiltersEvent extends CharactersEvent {}
