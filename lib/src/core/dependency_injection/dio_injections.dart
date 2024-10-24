import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/core/rest_client/dio_client.dart';
import 'package:rickandmorty/src/core/rest_client/rest_client.dart';

Future<void> initDioInjections() async {
  locator.registerLazySingleton(() => DioClient());
  locator.registerFactory(() => RestClient(locator<DioClient>().client));
}
