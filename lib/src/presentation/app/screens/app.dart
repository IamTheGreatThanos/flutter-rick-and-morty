import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/core/config/router.dart';
import 'package:rickandmorty/src/core/constants/app_theme.dart';
import 'package:rickandmorty/src/presentation/character_details/bloc/character_details_bloc.dart';
import 'package:rickandmorty/src/presentation/characters/bloc/characters_bloc.dart';
import 'package:rickandmorty/src/presentation/episodes/bloc/episodes_bloc.dart';
import 'package:rickandmorty/src/presentation/location_details/bloc/location_details_bloc.dart';
import 'package:rickandmorty/src/presentation/locations/bloc/location_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildBlocProviders(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            routerConfig: router,
          );
        },
      ),
    );
  }

  List<BlocProvider> _buildBlocProviders() {
    return [
      BlocProvider<CharactersBloc>(
        create: (context) =>
            locator<CharactersBloc>()..add(CharactersGetAllEvent()),
      ),
      BlocProvider<CharacterDetailsBloc>(
        create: (context) => locator<CharacterDetailsBloc>(),
      ),
      BlocProvider<LocationBloc>(
        create: (context) =>
            locator<LocationBloc>()..add(LocationsGetAllEvent()),
      ),
      BlocProvider<LocationDetailsBloc>(
        create: (context) => locator<LocationDetailsBloc>(),
      ),
      BlocProvider<EpisodesBloc>(
        create: (context) => locator<EpisodesBloc>()..add(EpisodesGetEvent()),
      ),
    ];
  }
}
