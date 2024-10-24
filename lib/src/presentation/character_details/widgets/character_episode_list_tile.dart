import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/domain/episodes/entities/episode_entity.dart';

class CharacterEpisodeListTile extends StatelessWidget {
  const CharacterEpisodeListTile({super.key, required this.episode});

  final EpisodeEntity episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  episode.episode,
                  style: AppTextStyles.captionSmall
                      .copyWith(color: AppColors.primary),
                ),
                Text(episode.name, style: AppTextStyles.bodyLarge),
                Text(
                  episode.air_date,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.textLight),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 24,
            color: AppColors.iconActive,
          )
        ],
      ),
    );
  }
}
