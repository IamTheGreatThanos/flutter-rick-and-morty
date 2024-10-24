import 'package:flutter/material.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/presentation/app/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const App());
}
