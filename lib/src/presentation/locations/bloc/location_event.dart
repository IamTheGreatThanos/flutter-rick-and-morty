part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

final class LocationsGetAllEvent extends LocationEvent {}

final class LocationsGetNextPageEvent extends LocationEvent {}
