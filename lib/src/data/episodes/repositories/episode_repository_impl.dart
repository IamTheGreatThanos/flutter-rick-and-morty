import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rickandmorty/src/core/errors/failure.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/data/episodes/datasources/episode_datasource.dart';
import 'package:rickandmorty/src/data/episodes/mappers/episode_mapper.dart';
import 'package:rickandmorty/src/data/episodes/mappers/get_episodes_response_mapper.dart';
import 'package:rickandmorty/src/data/episodes/models/episode_model.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';
import 'package:rickandmorty/src/domain/episodes/entities/get_episodes_response.dart';
import 'package:rickandmorty/src/domain/episodes/repositories/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  EpisodeRepositoryImpl({required EpisodeDatasource episodeDatasource})
      : _episodeDatasource = episodeDatasource;

  final EpisodeDatasource _episodeDatasource;

  @override
  ResultFuture<EpisodeEntity> getEpisodeById(int id) async {
    try {
      final EpisodeModel response = await _episodeDatasource.getEpisodeById(id);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error has occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<List<EpisodeEntity>> getMultipleEpisodes(List<int> ids) async {
    try {
      final response = await _episodeDatasource.getMultipleEpisodes(ids);
      return right(response.map((el) => el.toEntity()).toList());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error has occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<GetEpisodesResponseEntity> getAllEpisodes() async {
    try {
      final response = await _episodeDatasource.getAllEpisodes();
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error has occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<GetEpisodesResponseEntity> getEpisodes(
      int? page, String? name, String? episode) async {
    try {
      final response =
          await _episodeDatasource.getEpisodes(page, name, episode);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network error has occured",
          statusCode: e.response?.statusCode ?? 500));
    }
  }
}
