import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/characters/bloc/characters_bloc.dart';
import 'package:rickandmorty/src/presentation/characters/widgets/filter_widget.dart';

class CharactersFilterScreen extends StatelessWidget {
  const CharactersFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(context),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          String selectedStatus = '';
          String selectedGender = '';

          if (state is CharactersLoaded) {
            selectedStatus = state.selectedStatus;
            selectedGender = state.selectedGender;
          } else if (state is CharactersLoading) {
            selectedStatus = state.selectedStatus;
            selectedGender = state.selectedGender;
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.h,
                  _buildStatusSection(context, selectedStatus, selectedGender),
                  _buildDivider(),
                  _buildGenderSection(context, selectedStatus, selectedGender),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundCard,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.iconActive),
        onPressed: () => context.pop(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            locator<CharactersBloc>().add(CharactersClearFiltersEvent());
            context.pop();
          },
          child: Text(
            'Сбросить',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
      title: Text(
        "Фильтры",
        style: AppTextStyles.headerSmall.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildStatusSection(
      BuildContext context, String selectedStatus, String selectedGender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Статус",
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        24.h,
        FilterWidget(
          title: 'Живой',
          value: selectedStatus == 'alive',
          onTap: () {
            _updateFilters(
              selectedStatus: 'alive',
              selectedGender: selectedGender,
            );
          },
        ),
        24.h,
        FilterWidget(
          title: 'Мертвый',
          value: selectedStatus == 'dead',
          onTap: () {
            _updateFilters(
              selectedStatus: 'dead',
              selectedGender: selectedGender,
            );
          },
        ),
        24.h,
        FilterWidget(
          title: 'Неизвестно',
          value: selectedStatus == 'unknown',
          onTap: () {
            _updateFilters(
              selectedStatus: 'unknown',
              selectedGender: selectedGender,
            );
          },
        ),
      ],
    );
  }

  Widget _buildGenderSection(
      BuildContext context, String selectedStatus, String selectedGender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Пол",
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        24.h,
        FilterWidget(
          title: 'Мужской',
          value: selectedGender == 'male',
          onTap: () {
            _updateFilters(
              selectedStatus: selectedStatus,
              selectedGender: 'male',
            );
          },
        ),
        24.h,
        FilterWidget(
          title: 'Женский',
          value: selectedGender == 'female',
          onTap: () {
            _updateFilters(
              selectedStatus: selectedStatus,
              selectedGender: 'female',
            );
          },
        ),
        24.h,
        FilterWidget(
          title: 'Бесполый',
          value: selectedGender == 'genderless',
          onTap: () {
            _updateFilters(
              selectedStatus: selectedStatus,
              selectedGender: 'genderless',
            );
          },
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Divider(
        color: AppColors.borderLight,
        thickness: 1,
      ),
    );
  }

  void _updateFilters(
      {required String selectedStatus, required String selectedGender}) {
    locator<CharactersBloc>().add(
      CharactersUpdateFiltersEvent(
        status: selectedStatus,
        gender: selectedGender,
      ),
    );
  }
}
