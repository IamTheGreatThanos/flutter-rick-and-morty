import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_all_locations.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_locations_by_page.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetAllLocations _getAllLocations;
  final GetLocationsByPage _getLocationsByPage;

  LocationBloc(
      {required GetAllLocations getAllLocations,
      required GetLocationsByPage getLocationsByPage})
      : _getLocationsByPage = getLocationsByPage,
        _getAllLocations = getAllLocations,
        super(LocationInitial()) {
    on<LocationEvent>((event, emit) {});
    on<LocationsGetAllEvent>(_onGetAllLocations);
    on<LocationsGetNextPageEvent>(_onGetNextPage);
  }

  void _onGetAllLocations(
      LocationsGetAllEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final response = await _getAllLocations();
    response.fold((l) => emit(LocationFailure(message: l.message)), (r) {
      emit(LocationLoaded(result: r));
    });
  }

  void _onGetNextPage(
      LocationsGetNextPageEvent event, Emitter<LocationState> emit) async {
    final stateCopy = state as LocationLoaded;
    final nextUrl = stateCopy.result.info.next;
    if (nextUrl != null) {
      Uri uri = Uri.parse(nextUrl);
      final page = uri.queryParameters['page']!;
      final response = await _getLocationsByPage(int.parse(page));

      response.fold((l) {
        return;
      }, (r) {
        emit(stateCopy.copyWith(r));
      });
    }
  }
}
