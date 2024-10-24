part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsGetEvent extends CharacterDetailsEvent {
  const CharacterDetailsGetEvent(this.id);
  final int id;
}
