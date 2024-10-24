import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/src/presentation/bottom_tab/screens/main_screen.dart';
import 'package:rickandmorty/src/presentation/character_details/screens/character_details_screen.dart';
import 'package:rickandmorty/src/presentation/characters/screens/characters_filter_screen.dart';
import 'package:rickandmorty/src/presentation/characters/screens/characters_screen.dart';
import 'package:rickandmorty/src/presentation/episodes/screens/episodes_screen.dart';
import 'package:rickandmorty/src/presentation/location_details/screens/location_details_screen.dart';
import 'package:rickandmorty/src/presentation/locations/screens/locations_screen.dart';
import 'package:rickandmorty/src/presentation/login/screens/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainScreen(
              navigationShell: navigationShell,
            ),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/characters',
              name: 'characters',
              builder: (context, state) => const CharactersScreen(),
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/locations',
              name: 'locations',
              builder: (context, state) => const LocationsScreen(),
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/episodes',
              name: 'episodes',
              builder: (context, state) => const EpisodesScreen(),
            )
          ]),
        ]),
    GoRoute(
      path: '/character/:id',
      builder: (context, state) {
        final characterId = int.parse(state.pathParameters['id']!);
        return CharacterDetailsScreen(
          characterId: characterId,
        );
      },
    ),
    GoRoute(
      path: '/location/:id',
      builder: (context, state) {
        final locationId = int.parse(state.pathParameters['id']!);
        return LocationDetailsScreen(locationId: locationId);
      },
    ),
    GoRoute(
      path: '/characters/filter',
      builder: (context, state) {
        return const CharactersFilterScreen();
      },
    )
  ],
);
