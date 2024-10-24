import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_all_characters.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_characters.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_characters_by_page.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetAllCharacters _getAllCharacters;
  final GetCharactersByPage _getCharactersByPage;
  final GetCharacters _getCharacters;

  CharactersBloc({
    required GetAllCharacters getAllCharacters,
    required GetCharactersByPage getCharactersByPage,
    required GetCharacters getCharacters,
  })  : _getCharacters = getCharacters,
        _getAllCharacters = getAllCharacters,
        _getCharactersByPage = getCharactersByPage,
        super(CharactersLoading()) {
    on<CharactersGetAllEvent>(_onGetAllCharacters);
    on<CharactersGetEvent>(_onGetCharacters);
    on<CharactersGetNextPageEvent>(_onGetNextPage);
    on<CharactersUpdateFiltersEvent>(_onUpdateFilters);
    on<CharactersClearFiltersEvent>(_onClearFilters);
  }

  void _onGetAllCharacters(
      CharactersGetAllEvent event, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());
    final response = await _getAllCharacters();
    response.fold(
      (failure) => emit(CharactersFailure(message: failure.message)),
      (characters) => emit(CharactersLoaded(charactersList: characters)),
    );
  }

  void _onGetCharacters(
      CharactersGetEvent event, Emitter<CharactersState> emit) async {
    final currentState = state;
    if (currentState is CharactersLoaded) {
      emit(CharactersLoading(
        selectedStatus: currentState.selectedStatus,
        selectedGender: currentState.selectedGender,
      ));
    }

    final response = await _getCharacters(
      GetCharactersParams(
        page: event.page,
        status: event.status,
        gender: event.gender,
      ),
    );

    response.fold(
      (failure) => emit(CharactersFailure(message: failure.message)),
      (characters) {
        if (currentState is CharactersLoaded) {
          emit(currentState.copyWith(
            newList: characters,
            status: event.status ?? currentState.selectedStatus,
            gender: event.gender ?? currentState.selectedGender,
          ));
        } else {
          emit(CharactersLoaded(charactersList: characters));
        }
      },
    );
  }

  void _onGetNextPage(
      CharactersGetNextPageEvent event, Emitter<CharactersState> emit) async {
    if (state is! CharactersLoaded) return;
    final currentState = state as CharactersLoaded;

    final nextUrl = currentState.charactersList.info.next;
    if (nextUrl == null) return;

    final uri = Uri.parse(nextUrl);
    final pageNumber = int.tryParse(uri.queryParameters['page'] ?? '');

    final response = await _getCharacters(
      GetCharactersParams(
        page: pageNumber,
        status: currentState.selectedStatus.isNotEmpty
            ? currentState.selectedStatus
            : null,
        gender: currentState.selectedGender.isNotEmpty
            ? currentState.selectedGender
            : null,
      ),
    );

    response.fold(
      (failure) => null,
      (newCharacters) {
        emit(currentState.copyWith(
          newList: currentState.charactersList.copyWith(
            results:
                currentState.charactersList.results + newCharacters.results,
            info: newCharacters.info,
          ),
        ));
      },
    );
  }

  void _onUpdateFilters(
      CharactersUpdateFiltersEvent event, Emitter<CharactersState> emit) {
    if (state is CharactersLoaded) {
      final currentState = state as CharactersLoaded;

      final status = event.status ?? currentState.selectedStatus;
      final gender = event.gender ?? currentState.selectedGender;

      print(status);

      emit(currentState.copyWith(status: status, gender: gender));

      add(CharactersGetEvent(
        page: 1,
        status: status,
        gender: gender,
      ));
    }
  }

  void _onClearFilters(
      CharactersClearFiltersEvent event, Emitter<CharactersState> emit) {
    if (state is CharactersLoaded) {
      final currentState = state as CharactersLoaded;

      emit(currentState.copyWith(status: '', gender: ''));

      add(const CharactersGetEvent(
        page: 1,
        status: null,
        gender: null,
      ));
    }
  }
}
