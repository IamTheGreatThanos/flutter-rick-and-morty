import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_multiple_characters.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_location_by_id.dart';

part 'location_details_event.dart';
part 'location_details_state.dart';

class LocationDetailsBloc
    extends Bloc<LocationDetailsEvent, LocationDetailsState> {
  final GetLocationById _getLocationById;
  final GetMultipleCharacters _getMultipleCharacters;
  LocationDetailsBloc(
      {required GetLocationById getLocationById,
      required GetMultipleCharacters getMultipleCharacters})
      : _getLocationById = getLocationById,
        _getMultipleCharacters = getMultipleCharacters,
        super(LocationDetailsInitial()) {
    on<LocationDetailsEvent>((event, emit) {});
    on<LocationDetailsGetEvent>(_onLocationDetailsGet);
  }

  void _onLocationDetailsGet(
      LocationDetailsGetEvent event, Emitter<LocationDetailsState> emit) async {
    emit(LocationDetailsLoading());
    final result = await _getLocationById(event.id);
    await result
        .fold((l) async => emit(LocationDetailsFailure(message: l.message)),
            (location) async {
      RegExp regExp = RegExp(r'\/character\/(\d{1,3})$');
      final characterIdList = location.residents.map((el) {
        final match = regExp.firstMatch(el);
        return int.parse(match!.group(1)!);
      }).toList();

      final charactersFetchResult =
          await _getMultipleCharacters(characterIdList);
      await charactersFetchResult
          .fold((l) async => emit(LocationDetailsFailure(message: l.message)),
              (r) async {
        emit(LocationDetailsLoaded(location: location, residents: r));
      });
    });
  }
}
