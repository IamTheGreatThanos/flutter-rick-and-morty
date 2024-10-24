import 'package:get_it/get_it.dart';
import 'package:rickandmorty/src/core/dependency_injection/bloc_injections.dart';
import 'package:rickandmorty/src/core/dependency_injection/datasource_injections.dart';
import 'package:rickandmorty/src/core/dependency_injection/dio_injections.dart';
import 'package:rickandmorty/src/core/dependency_injection/repository_injections.dart';
import 'package:rickandmorty/src/core/dependency_injection/usecase_injections.dart';

final GetIt locator = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initBlocInjections();
  await initDatasourceInjections();
  await initRepositoryInjections();
  await initUsecaseInjections();
}
