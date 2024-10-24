import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rickandmorty/src/core/errors/failure.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/data/characters/datasources/characters_datasource.dart';
import 'package:rickandmorty/src/data/characters/mappers/character_mapper.dart';
import 'package:rickandmorty/src/data/characters/mappers/get_characters_response_mapper.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';
import 'package:rickandmorty/src/domain/characters/entities/get_characters_response_entity.dart';
import 'package:rickandmorty/src/domain/characters/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDatasource _charactersDatasource;

  const CharactersRepositoryImpl(
      {required CharactersDatasource charactersDatasource})
      : _charactersDatasource = charactersDatasource;

  // Get first page of characters
  @override
  ResultFuture<GetCharactersResponseEntity> getAllCharacters() async {
    try {
      final response = await _charactersDatasource.getAllCharacters();

      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: "Failed to fetch characters",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  // Get specified page of characters
  @override
  ResultFuture<GetCharactersResponseEntity> getCharactersByPage(
      int page) async {
    try {
      final response = await _charactersDatasource.getCharactersByPage(page);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: "Failed to fetch characters",
          statusCode: e.response?.statusCode ?? 500));
    } catch (e) {
      return left(const UnknownError(
          message: "Unknown error has occured", statusCode: 0));
    }
  }

  @override
  ResultFuture<CharacterEntity> getCharacterById(int id) async {
    try {
      final response = await _charactersDatasource.getCharacterById(id);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<List<CharacterEntity>> getMultipleCharacters(
      List<int> ids) async {
    try {
      final response = await _charactersDatasource.getMultipleCharacters(ids);
      return right(response.map((el) => el.toEntity()).toList());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<GetCharactersResponseEntity> getCharacters(
      int? page,
      String? name,
      String? status,
      String? species,
      String? type,
      String? gender) async {
    try {
      final response = await _charactersDatasource.getCharacters(
          page, name, status, species, type, gender);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Failed to fetch characters",
          statusCode: e.response?.statusCode ?? 500));
    } catch (e) {
      return left(const UnknownError(
          message: "Unknown error has occured", statusCode: 0));
    }
  }
}
