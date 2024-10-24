import 'package:equatable/equatable.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_location_entity.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationEntity origin;
  final CharacterLocationEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  @override
  List<Object?> get props => [id];
}
