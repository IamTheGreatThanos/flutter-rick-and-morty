import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_all_episodes.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_episodes.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final GetAllEpisodes _getAllEpisodes;
  final GetEpisodes _getEpisodes;

  EpisodesBloc(
      {required GetAllEpisodes getAllEpisodes,
      required GetEpisodes getEpisodes})
      : _getAllEpisodes = getAllEpisodes,
        _getEpisodes = getEpisodes,
        super(EpisodesInitial()) {
    on<EpisodesGetEvent>(_onEpisodesGet);
    on<EpisodesGetNextPageEvent>(_onEpisodesGetNextPage);
  }

  void _onEpisodesGet(
      EpisodesGetEvent event, Emitter<EpisodesState> emit) async {
    emit(EpisodesLoading());
    final result = await _getAllEpisodes();
    await result.fold((l) async => emit(EpisodesFailure(message: l.message)),
        (r) async {
      emit(EpisodesLoaded(result: r));
    });
  }

  void _onEpisodesGetNextPage(
      EpisodesGetNextPageEvent event, Emitter<EpisodesState> emit) async {
    final stateCopy = state as EpisodesLoaded;
    if (stateCopy.result.info.next == null) {
      return;
    }

    final uri = Uri.parse(stateCopy.result.info.next!);

    final String? page = uri.queryParameters['page'];
    final String? name = uri.queryParameters['name'];
    final String? episode = uri.queryParameters['episode'];

    final int? pageNumber = page != null ? int.tryParse(page) : null;

    final result = await _getEpisodes(
        GetEpisodesParams(page: pageNumber, name: name, episode: episode));

    await result.fold((l) async => emit(const EpisodesFailure()), (r) async {
      emit(stateCopy.copyWith(newResponse: r));
    });
  }
}
