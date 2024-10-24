part of 'episodes_bloc.dart';

sealed class EpisodesEvent extends Equatable {
  const EpisodesEvent();

  @override
  List<Object> get props => [];
}

final class EpisodesGetEvent extends EpisodesEvent {}

final class EpisodesGetNextPageEvent extends EpisodesEvent {}
