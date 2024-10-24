import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/data/characters/datasources/characters_datasource.dart';
import 'package:rickandmorty/src/data/episodes/datasources/episode_datasource.dart';
import 'package:rickandmorty/src/data/locations/datasources/location_datasource.dart';

Future<void> initDatasourceInjections() async {
  locator.registerFactory<CharactersDatasource>(
      () => CharactersDatasourceImpl(locator()));
  locator.registerFactory<LocationDatasource>(
      () => LocationDatasourceImpl(restClient: locator()));
  locator.registerFactory<EpisodeDatasource>(
      () => EpisodeDatasourceImpl(locator()));
}
