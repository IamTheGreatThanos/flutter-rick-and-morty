import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/components/primary_button.dart';
import 'package:rickandmorty/src/components/search_text_field.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/character_details/widgets/character_episode_list_tile.dart';
import 'package:rickandmorty/src/presentation/episodes/bloc/episodes_bloc.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<EpisodesBloc, EpisodesState>(
            builder: (context, state) {
              if (state is EpisodesLoading) {
                return _buildLoadingState();
              }
              if (state is EpisodesLoaded) {
                return _buildLoadedState(state);
              }
              if (state is EpisodesFailure) {
                return _buildErrorState(state);
              }
              return _buildUnhandledState();
            },
          ),
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

  Widget _buildLoadedState(EpisodesLoaded state) {
    final episodes = state.result.results;

    return Column(
      children: [
        10.h,
        _buildSearchBar(),
        26.h,
        _buildEpisodesList(episodes),
      ],
    );
  }

  Widget _buildSearchBar() {
    return const SearchTextField(
      hintText: "Поиск эпизода",
    );
  }

  Widget _buildEpisodesList(List episodes) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          if (index == episodes.length - 1) {
            _loadNextPage();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CharacterEpisodeListTile(
              episode: episodes[index],
            ),
          );
        },
      ),
    );
  }

  void _loadNextPage() {
    locator<EpisodesBloc>().add(EpisodesGetNextPageEvent());
  }

  Widget _buildErrorState(EpisodesFailure state) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.statusError,
          ),
          24.h,
          Text(
            state.message,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          24.h,
          SizedBox(
            width: 200,
            child: PrimaryButton(
              title: "Обновить",
              onTap: () => locator<EpisodesBloc>().add(EpisodesGetEvent()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnhandledState() {
    return Center(
      child: Text(
        "Произошла ошибка",
        style: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
