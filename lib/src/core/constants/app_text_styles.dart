import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';

final class AppTextStyles {
  static const status = TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
  static const name = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static const headerLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const headerMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const headerSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const captionLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const captionMedium = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const captionSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}
