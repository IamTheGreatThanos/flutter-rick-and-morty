import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/presentation/character_details/bloc/character_details_bloc.dart';
import 'package:rickandmorty/src/presentation/characters/bloc/characters_bloc.dart';
import 'package:rickandmorty/src/presentation/episodes/bloc/episodes_bloc.dart';
import 'package:rickandmorty/src/presentation/location_details/bloc/location_details_bloc.dart';
import 'package:rickandmorty/src/presentation/locations/bloc/location_bloc.dart';

Future<void> initBlocInjections() async {
  locator.registerLazySingleton(() => CharactersBloc(
      getAllCharacters: locator(),
      getCharactersByPage: locator(),
      getCharacters: locator()));

  locator.registerLazySingleton(() => CharacterDetailsBloc(
      getCharacterById: locator(), getMultipleEpisodes: locator()));

  locator.registerLazySingleton(() =>
      LocationBloc(getAllLocations: locator(), getLocationsByPage: locator()));

  locator.registerLazySingleton(() => LocationDetailsBloc(
      getLocationById: locator(), getMultipleCharacters: locator()));

  locator.registerLazySingleton(
      () => EpisodesBloc(getAllEpisodes: locator(), getEpisodes: locator()));
}
