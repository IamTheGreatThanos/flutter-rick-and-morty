import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: _onNavigationItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.iconInactive,
      backgroundColor: Colors.white,
      elevation: 0,
      selectedFontSize: 12,
      items: _navigationItems,
    );
  }

  List<BottomNavigationBarItem> get _navigationItems => [
        _buildNavigationItem(
          icon: Icons.person,
          label: 'Персонажи',
        ),
        _buildNavigationItem(
          icon: Icons.person,
          label: 'Локации',
        ),
        _buildNavigationItem(
          icon: Icons.person,
          label: 'Эпизоды',
        ),
      ];

  BottomNavigationBarItem _buildNavigationItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      activeIcon: Icon(icon, color: AppColors.primary),
      icon: Icon(icon, color: AppColors.iconInactive),
      label: label,
    );
  }

  void _onNavigationItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
