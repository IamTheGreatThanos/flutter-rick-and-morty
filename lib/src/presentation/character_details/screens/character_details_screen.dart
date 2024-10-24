import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/components/primary_button.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/character_details/bloc/character_details_bloc.dart';
import 'package:rickandmorty/src/presentation/character_details/widgets/character_episode_list_tile.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({super.key, required this.characterId});
  final int characterId;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  void initState() {
    super.initState();
    locator<CharacterDetailsBloc>()
        .add(CharacterDetailsGetEvent(widget.characterId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CharacterDetailsLoaded) {
            return _buildLoadedContent(context, state);
          }
          if (state is CharacterDetailsFailure) {
            return _buildErrorContent(state);
          }
          return const Text("None");
        },
      ),
    );
  }

  Widget _buildLoadedContent(
      BuildContext context, CharacterDetailsLoaded state) {
    final size = MediaQuery.of(context).size;
    final character = state.character;

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          _buildHeaderSection(size, character.image),
          _buildCharacterInfo(character, size),
          36.h,
          const Divider(color: AppColors.borderLight),
          36.h,
          _buildEpisodesSection(state.episodes),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(Size size, String imageUrl) {
    return SizedBox(
      height: size.height * 0.25 + 80,
      child: Stack(
        children: [
          _buildBlurredBackground(size, imageUrl),
          _buildProfileImage(size, imageUrl),
          _buildBackButton(),
        ],
      ),
    );
  }

  Widget _buildBlurredBackground(Size size, String imageUrl) {
    return Container(
      height: size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.clamp),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundCard.withOpacity(0.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(Size size, String imageUrl) {
    return Positioned(
      top: size.height * 0.25 - 90,
      left: size.width / 2 - 90,
      child: CircleAvatar(
        radius: 90,
        backgroundColor: AppColors.backgroundCard,
        child: CircleAvatar(
          foregroundImage: NetworkImage(imageUrl),
          radius: 80,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 16,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: AppColors.backgroundCard),
        ),
      ),
    );
  }

  Widget _buildCharacterInfo(character, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(character.name, style: AppTextStyles.headerLarge),
          4.h,
          Text(
            character.status.toUpperCase(),
            style:
                AppTextStyles.status.copyWith(color: AppColors.statusSuccess),
          ),
          24.h,
          _buildCharacterDetails(character, size),
          20.h,
          _buildLocationInfo(character),
        ],
      ),
    );
  }

  Widget _buildCharacterDetails(character, Size size) {
    return Row(
      children: [
        _buildDetailItem('Gender', character.gender),
        (size.width * 0.3).w,
        _buildDetailItem('Species', character.species),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        4.h,
        Text(value, style: AppTextStyles.bodyMedium),
      ],
    );
  }

  Widget _buildLocationInfo(character) {
    return Column(
      children: [
        _buildLocationItem(
          'Birth location',
          character.origin.name,
          character.origin.url,
        ),
        24.h,
        _buildLocationItem(
          'Location',
          character.location.name,
          character.location.url,
        ),
      ],
    );
  }

  Widget _buildLocationItem(String label, String name, String url) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _navigateToLocation(url),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodySmall),
              4.h,
              Text(name, style: AppTextStyles.bodyMedium),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              size: 18, color: AppColors.iconActive),
        ],
      ),
    );
  }

  void _navigateToLocation(String url) {
    final locationId = int.tryParse(
      url.substring(url.lastIndexOf('/') + 1),
    );
    if (locationId != null) {
      context.push('/location/$locationId');
    }
  }

  Widget _buildEpisodesSection(episodes) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Episodes", style: AppTextStyles.headerSmall),
          24.h,
          ...episodes
              .map((episode) => CharacterEpisodeListTile(episode: episode)),
        ],
      ),
    );
  }

  Widget _buildErrorContent(CharacterDetailsFailure state) {
    return SizedBox.expand(
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
          24.h,
          Text(
            state.message,
            style: AppTextStyles.captionLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          24.h,
          SizedBox(
            width: 200,
            child: PrimaryButton(
              title: "Попробовать снова",
              onTap: () => locator<CharacterDetailsBloc>()
                  .add(CharacterDetailsGetEvent(widget.characterId)),
            ),
          ),
        ],
      ),
    );
  }
}
