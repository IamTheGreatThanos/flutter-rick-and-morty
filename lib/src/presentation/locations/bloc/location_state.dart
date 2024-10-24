part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  const LocationLoaded({required this.result});

  final GetLocationsResponseEntity result;

  @override
  List<Object> get props => [result];

  LocationLoaded copyWith(GetLocationsResponseEntity newList) {
    return LocationLoaded(
        result: GetLocationsResponseEntity(
            info: newList.info, results: result.results + newList.results));
  }
}

final class LocationFailure extends LocationState {
  const LocationFailure({this.message = "Произошла ошибка"});
  final String message;
}
