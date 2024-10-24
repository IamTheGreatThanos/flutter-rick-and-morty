part of 'episodes_bloc.dart';

sealed class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

final class EpisodesInitial extends EpisodesState {}

final class EpisodesLoading extends EpisodesState {}

final class EpisodesLoaded extends EpisodesState {
  const EpisodesLoaded({required this.result});

  final GetEpisodesResponseEntity result;

  EpisodesLoaded copyWith({required GetEpisodesResponseEntity newResponse}) {
    return EpisodesLoaded(
        result: GetEpisodesResponseEntity(
            info: newResponse.info,
            results: result.results + newResponse.results));
  }

  @override
  List<Object> get props => [result];
}

final class EpisodesFailure extends EpisodesState {
  const EpisodesFailure({this.message = 'Произошла ошибка'});
  final String message;
}
