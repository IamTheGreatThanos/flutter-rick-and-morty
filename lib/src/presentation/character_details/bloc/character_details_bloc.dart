import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_character_by_id.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_multiple_episodes.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final GetCharacterById _getCharacterById;
  final GetMultipleEpisodes _getMultipleEpisodes;

  CharacterDetailsBloc(
      {required GetCharacterById getCharacterById,
      required GetMultipleEpisodes getMultipleEpisodes})
      : _getCharacterById = getCharacterById,
        _getMultipleEpisodes = getMultipleEpisodes,
        super(CharacterDetailsInitial()) {
    on<CharacterDetailsEvent>((event, emit) {});
    on<CharacterDetailsGetEvent>(_onCharacterDetailsGet);
  }

  void _onCharacterDetailsGet(CharacterDetailsGetEvent event,
      Emitter<CharacterDetailsState> emit) async {
    emit(CharacterDetailsLoading());
    final result = await _getCharacterById(event.id);
    await result
        .fold((l) async => emit(CharacterDetailsFailure(message: l.message)),
            (character) async {
      RegExp regExp = RegExp(r'\/episode\/(\d{1,2})$');
      final episodeIdList = character.episode.map((el) {
        final match = regExp.firstMatch(el);
        return int.parse(match!.group(1)!);
      }).toList();

      final episodeFetchResult = await _getMultipleEpisodes(episodeIdList);
      await episodeFetchResult
          .fold((l) async => emit(CharacterDetailsFailure(message: l.message)),
              (r) async {
        emit(CharacterDetailsLoaded(character: character, episodes: r));
      });
    });
  }
}
