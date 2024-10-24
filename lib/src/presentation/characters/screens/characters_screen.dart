import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/src/components/primary_button.dart';
import 'package:rickandmorty/src/components/search_text_field.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/characters/bloc/characters_bloc.dart';
import 'package:rickandmorty/src/presentation/characters/widgets/character_list_tile.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: SafeArea(
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoading) {
              return _buildLoadingState();
            }
            if (state is CharactersLoaded) {
              return _buildLoadedState(context, state);
            }
            if (state is CharactersFailure) {
              return _buildErrorState(context, state);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, CharactersLoaded state) {
    final characterList = state.charactersList.results;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.h,
        _buildSearchBar(context, state),
        10.h,
        _buildCharacterCount(state.charactersList.info.count),
        10.h,
        _buildCharacterList(characterList, context),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, CharactersLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SearchTextField(
        hintText: "Поиск персонажа",
        onFilterTap: () => context.push('/characters/filter'),
      ),
    );
  }

  Widget _buildCharacterCount(int count) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Найдено персонажей: $count",
          style: AppTextStyles.captionMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterList(List characters, BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.backgroundLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == characters.length - 1) {
                context
                    .read<CharactersBloc>()
                    .add(CharactersGetNextPageEvent());
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CharacterListTile(
                  character: characters[index],
                  onTap: () =>
                      context.push('/character/${characters[index].id}'),
                ),
              );
            },
            itemCount: characters.length,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, CharactersFailure state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.statusError.withOpacity(0.1),
            ),
            child: const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.statusError,
            ),
          ),
          32.h,
          Text(
            state.message,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          32.h,
          SizedBox(
            width: 220,
            child: PrimaryButton(
              title: "Обновить",
              onTap: () =>
                  context.read<CharactersBloc>().add(CharactersGetAllEvent()),
            ),
          ),
        ],
      ),
    );
  }
}
