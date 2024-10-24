part of 'location_details_bloc.dart';

sealed class LocationDetailsEvent extends Equatable {
  const LocationDetailsEvent();

  @override
  List<Object> get props => [];
}

final class LocationDetailsGetEvent extends LocationDetailsEvent {
  const LocationDetailsGetEvent({required this.id});
  final int id;
}
