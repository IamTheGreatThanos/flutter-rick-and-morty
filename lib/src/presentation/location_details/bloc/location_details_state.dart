part of 'location_details_bloc.dart';

sealed class LocationDetailsState extends Equatable {
  const LocationDetailsState();

  @override
  List<Object> get props => [];
}

final class LocationDetailsInitial extends LocationDetailsState {}

final class LocationDetailsLoading extends LocationDetailsState {}

final class LocationDetailsLoaded extends LocationDetailsState {
  const LocationDetailsLoaded(
      {required this.location, required this.residents});

  final LocationEntity location;
  final List<CharacterEntity> residents;

  LocationDetailsLoaded copyWith(
      {LocationEntity? location, List<CharacterEntity>? residents}) {
    return LocationDetailsLoaded(
        location: location ?? this.location,
        residents: residents ?? this.residents);
  }

  @override
  List<Object> get props => [location, residents];
}

final class LocationDetailsFailure extends LocationDetailsState {
  const LocationDetailsFailure({this.message = "Произошла ошибка"});
  final String message;
}
