import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/data/characters/repositories/characters_repository_impl.dart';
import 'package:rickandmorty/src/data/episodes/repositories/episode_repository_impl.dart';
import 'package:rickandmorty/src/data/locations/repositories/location_repository_impl.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';
import 'package:rickandmorty/src/domain/locations/repositories/location_repository.dart';

Future<void> initRepositoryInjections() async {
  locator.registerFactory<CharactersRepository>(
      () => CharactersRepositoryImpl(charactersDatasource: locator()));
  locator.registerFactory<LocationRepository>(
      () => LocationRepositoryImpl(locationDatasource: locator()));
  locator.registerFactory<EpisodeRepository>(
      () => EpisodeRepositoryImpl(episodeDatasource: locator()));
}
