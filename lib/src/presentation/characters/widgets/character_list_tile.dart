import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/domain/characters/entities/character_entity.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile(
      {super.key,
      required this.character,
      required this.onTap,
      this.showChevron = false});

  final CharacterEntity character;
  final VoidCallback onTap;
  final bool showChevron;

  Color _getStatusColor(String status) {
    return status.toLowerCase() == "alive"
        ? AppColors.statusSuccess
        : AppColors.statusError;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 74,
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(37),
          boxShadow: [
            BoxShadow(
              color: AppColors.backgroundDark.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildCharacterAvatar(),
            18.w,
            _buildCharacterInfo(),
            if (showChevron) _buildChevronIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.borderLight,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(37),
        child: CachedNetworkImage(
          placeholder: (context, url) => _buildPlaceholder(),
          errorWidget: (context, url, error) => _buildPlaceholder(),
          imageUrl: character.image,
          fit: BoxFit.cover,
          width: 74,
          height: 74,
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.backgroundDark.withOpacity(0.1),
      child: const Icon(
        Icons.person,
        size: 32,
        color: AppColors.iconInactive,
      ),
    );
  }

  Widget _buildCharacterInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _getStatusColor(character.status).withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              character.status.toUpperCase(),
              style: AppTextStyles.status.copyWith(
                color: _getStatusColor(character.status),
              ),
            ),
          ),
          4.h,
          Text(
            character.name,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          4.h,
          Text(
            "${character.species}, ${character.gender}",
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChevronIcon() {
    return const Padding(
      padding: EdgeInsets.only(right: 16),
      child: Icon(
        Icons.chevron_right_rounded,
        color: AppColors.iconActive,
        size: 24,
      ),
    );
  }
}
