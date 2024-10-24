import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rickandmorty/src/core/errors/failure.dart';
import 'package:rickandmorty/src/core/utils/typedef.dart';
import 'package:rickandmorty/src/data/locations/datasources/location_datasource.dart';
import 'package:rickandmorty/src/data/locations/mappers/get_locations_response_mapper.dart';
import 'package:rickandmorty/src/data/locations/mappers/location_mapper.dart';
import 'package:rickandmorty/src/domain/locations/entities/get_locations_response_entity.dart';
import 'package:rickandmorty/src/domain/locations/entities/location_entity.dart';
import 'package:rickandmorty/src/domain/locations/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource _locationDatasource;

  const LocationRepositoryImpl({required LocationDatasource locationDatasource})
      : _locationDatasource = locationDatasource;

  @override
  ResultFuture<GetLocationsResponseEntity> getAllLocations() async {
    try {
      final response = await _locationDatasource.getAllLocations();
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network Failure",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<LocationEntity> getLocationById(int id) async {
    try {
      final response = await _locationDatasource.getLocationById(id);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network Failure",
          statusCode: e.response?.statusCode ?? 500));
    }
  }

  @override
  ResultFuture<GetLocationsResponseEntity> getLocationsByPage(int page) async {
    try {
      final response = await _locationDatasource.getLocationsByPage(page);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ApiFailure(
          message: e.message ?? "Network Failure",
          statusCode: e.response?.statusCode ?? 500));
    }
  }
}
