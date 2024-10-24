import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_all_characters.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_character_by_id.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_characters.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_characters_by_page.dart';
import 'package:rickandmorty/src/domain/characters/usecases/get_multiple_characters.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_all_episodes.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_episode_by_id.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_episodes.dart';
import 'package:rickandmorty/src/domain/episodes/usecases/get_multiple_episodes.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_all_locations.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_location_by_id.dart';
import 'package:rickandmorty/src/domain/locations/usecases/get_locations_by_page.dart';

Future<void> initUsecaseInjections() async {
  // Character usecases
  locator.registerFactory(() => GetAllCharacters(locator()));
  locator.registerFactory(() => GetCharactersByPage(locator()));
  locator.registerFactory(() => GetMultipleCharacters(locator()));
  locator.registerFactory(() => GetCharacterById(locator()));
  locator.registerFactory(() => GetCharacters(locator()));

  // Location usecases
  locator.registerFactory(() => GetAllLocations(locator()));
  locator.registerFactory(() => GetLocationsByPage(locator()));
  locator.registerFactory(() => GetLocationById(locator()));

  // Episode usecases
  locator.registerFactory(() => GetEpisodeById(locator()));
  locator.registerFactory(() => GetMultipleEpisodes(locator()));
  locator.registerFactory(() => GetEpisodes(locator()));
  locator.registerFactory(() => GetAllEpisodes(locator()));
}
