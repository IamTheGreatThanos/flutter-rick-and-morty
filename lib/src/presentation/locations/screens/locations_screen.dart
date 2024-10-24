import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/components/primary_button.dart';
import 'package:rickandmorty/src/components/search_text_field.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/locations/bloc/location_bloc.dart';
import 'package:rickandmorty/src/presentation/locations/widgets/location_list_tile.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return _buildLoadingState();
              }
              if (state is LocationLoaded) {
                return _buildLoadedState(context, state);
              }
              if (state is LocationFailure) {
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

  Widget _buildLoadedState(BuildContext context, LocationLoaded state) {
    final locationList = state.result.results;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.h,
        _buildSearchBar(),
        10.h,
        _buildLocationCount(state.result.info.count),
        10.h,
        _buildLocationsList(context, locationList),
      ],
    );
  }

  Widget _buildSearchBar() {
    return const SearchTextField(
      hintText: "Поиск локации",
    );
  }

  Widget _buildLocationCount(int count) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Найдено локаций: $count",
          style: AppTextStyles.captionMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationsList(BuildContext context, List locations) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          if (index == locations.length - 1) {
            _loadNextPage();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: LocationListTile(
              location: locations[index],
              onTap: () => _navigateToLocation(context, locations[index].id),
            ),
          );
        },
      ),
    );
  }

  void _loadNextPage() {
    locator<LocationBloc>().add(LocationsGetNextPageEvent());
  }

  void _navigateToLocation(BuildContext context, int locationId) {
    context.push('/location/$locationId');
  }

  Widget _buildErrorState(LocationFailure state) {
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
              onTap: () => locator<LocationBloc>().add(LocationsGetAllEvent()),
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
