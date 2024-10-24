import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/dependency_injection.dart';
import 'package:rickandmorty/src/components/primary_button.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';
import 'package:rickandmorty/src/presentation/characters/widgets/character_list_tile.dart';
import 'package:rickandmorty/src/presentation/location_details/bloc/location_details_bloc.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({super.key, required this.locationId});

  final int locationId;

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    _loadLocationDetails();
  }

  void _loadLocationDetails() {
    locator<LocationDetailsBloc>()
        .add(LocationDetailsGetEvent(id: widget.locationId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LocationDetailsBloc, LocationDetailsState>(
        builder: (context, state) {
          if (state is LocationDetailsLoading) {
            return _buildLoadingState();
          }
          if (state is LocationDetailsLoaded) {
            return _buildLoadedState(context, state);
          }
          if (state is LocationDetailsFailure) {
            return _buildErrorState(state);
          }
          return _buildEmptyState();
        },
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

  Widget _buildLoadedState(BuildContext context, LocationDetailsLoaded state) {
    final size = MediaQuery.of(context).size;
    final location = state.location;

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context, size),
          _buildLocationInfo(location),
          _buildResidentsList(context, state.residents),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Size size) {
    return Stack(
      children: [
        _buildHeaderImage(size),
        _buildBottomCurve(size),
        _buildBackButton(context),
      ],
    );
  }

  Widget _buildHeaderImage(Size size) {
    return CachedNetworkImage(
      width: size.width,
      height: size.height * 0.3,
      fit: BoxFit.cover,
      imageUrl:
          'https://www.gadunky.com/wp-content/uploads/2018/10/rick-and-morty_ccc.jpg',
      placeholder: (context, url) => _buildImagePlaceholder(),
      errorWidget: (context, url, error) => _buildImagePlaceholder(),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: AppColors.backgroundDark.withOpacity(0.1),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 48,
          color: AppColors.iconInactive,
        ),
      ),
    );
  }

  Widget _buildBottomCurve(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 34,
        decoration: const BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      left: 16,
      top: MediaQuery.of(context).padding.top + 8,
      child: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.backgroundDark.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.backgroundCard,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationInfo(location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name,
            style: AppTextStyles.headerMedium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          8.h,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${location.type} - ${location.dimension}",
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResidentsList(BuildContext context, List residents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Персонажи",
                style: AppTextStyles.headerSmall.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "Всего: ${residents.length}",
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        10.h,
        Container(
          color: AppColors.backgroundLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ...residents.map(
                  (character) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CharacterListTile(
                      showChevron: true,
                      character: character,
                      onTap: () => context.push('/character/${character.id}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildErrorState(LocationDetailsFailure state) {
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
              onTap: _loadLocationDetails,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "Нет данных",
        style: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
