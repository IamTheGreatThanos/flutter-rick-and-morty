import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty/src/data/characters/models/character_model.dart';
import 'package:rickandmorty/src/data/characters/models/get_characters_response.dart';
import 'package:rickandmorty/src/data/episodes/models/episode_model.dart';
import 'package:rickandmorty/src/data/episodes/models/get_episodes_response.dart';
import 'package:rickandmorty/src/data/locations/models/get_locations_response.dart';
import 'package:rickandmorty/src/data/locations/models/location_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // Characters
  // Get all characters
  @GET('/character')
  Future<GetCharactersResponse> getAllCharacters();

  @GET('/character')
  Future<GetCharactersResponse> getCharacters(
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('status') String? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') String? gender,
  );

  // Get characters by page
  @GET('/character')
  Future<GetCharactersResponse> getCharactersByPage(@Query("page") int page);

  // Get multiple characters
  @GET('/character/{ids}')
  Future<List<CharacterModel>> getMultipleCharacters(
      @Path("ids") List<int> ids);

  // Get character by id
  @GET("/character/{id}")
  Future<CharacterModel> getCharacterById(@Path('id') int id);

  // Locations
  // Get all locations
  @GET('/location')
  Future<GetLocationsResponse> getAllLocations();

  // Get locations by page
  @GET('/location')
  Future<GetLocationsResponse> getLocationsByPage(@Query('page') int page);

  // Get location by id
  @GET("/location/{id}")
  Future<LocationModel> getLocationById(@Path('id') int id);

  // Episodes
  // Get all episodes
  @GET("/episode")
  Future<GetEpisodesResponse> getAllEpisodes();

  @GET('/episode')
  Future<GetEpisodesResponse> getEpisodesByPage(@Query("page") int page);

  @GET('/episode')
  Future<GetEpisodesResponse> getEpisodes(
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('episode') String? episode,
  );

  // Get multiple episodes
  @GET('/episode/{ids}')
  Future<List<EpisodeModel>> getMultipleEpisodes(@Path('ids') List<int> ids);

  // Get episode by id
  @GET('/episode/{id}')
  Future<EpisodeModel> getEpisodeById(@Path('id') int id);
}
