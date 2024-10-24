import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.onFilterTap,
  });

  final String hintText;
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: AppTextStyles.captionLarge.copyWith(
            color: AppColors.iconInactive,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.iconActive,
          ),
          suffixIcon: GestureDetector(
            onTap: onFilterTap,
            child: _buildFilterButton(),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1,
          height: 20,
          color: AppColors.borderLight,
        ),
        12.w,
        const Icon(
          Icons.filter_list_outlined,
          color: AppColors.iconActive,
        ),
        12.w,
      ],
    );
  }
}
