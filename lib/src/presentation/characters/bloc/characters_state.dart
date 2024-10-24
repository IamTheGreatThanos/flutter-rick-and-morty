part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersLoading extends CharactersState {
  const CharactersLoading({
    this.selectedStatus = '',
    this.selectedGender = '',
  });

  final String selectedStatus;
  final String selectedGender;

  @override
  List<Object> get props => [selectedStatus, selectedGender];
}

final class CharactersLoaded extends CharactersState {
  const CharactersLoaded({
    required this.charactersList,
    this.selectedStatus = '',
    this.selectedGender = '',
  });

  final GetCharactersResponseEntity charactersList;
  final String selectedStatus;
  final String selectedGender;

  @override
  List<Object> get props => [
        charactersList,
        selectedStatus,
        selectedGender,
      ];

  CharactersLoaded copyWith({
    GetCharactersResponseEntity? newList,
    String? status,
    String? gender,
  }) {
    return CharactersLoaded(
      charactersList: newList ?? charactersList,
      selectedStatus: status ?? selectedStatus,
      selectedGender: gender ?? selectedGender,
    );
  }
}

final class CharactersFailure extends CharactersState {
  const CharactersFailure({this.message = 'Произошла ошибка'});
  final String message;

  @override
  List<Object> get props => [message];
}
