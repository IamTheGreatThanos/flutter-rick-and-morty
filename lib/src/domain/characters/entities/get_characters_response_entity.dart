import 'package:equatable/equatable.dart';
import 'package:rickandmorty/src/core/entities/response_info_entity.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';

class GetCharactersResponseEntity extends Equatable {
  final ResponseInfoEntity info;
  final List<CharacterEntity> results;

  const GetCharactersResponseEntity({
    required this.info,
    required this.results,
  });

  GetCharactersResponseEntity copyWith({
    ResponseInfoEntity? info,
    List<CharacterEntity>? results,
  }) {
    return GetCharactersResponseEntity(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [info, results];
}
