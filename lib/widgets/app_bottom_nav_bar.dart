import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    _NavItem(asset: 'assets/icons/nav_nutrition.png', label: 'Nutrition'),
    _NavItem(asset: 'assets/icons/nav_plan.png', label: 'Plan'),
    _NavItem(asset: 'assets/icons/nav_mood.png', label: 'Mood'),
    _NavItem(asset: 'assets/icons/nav_profile.png', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.divider, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isActive = currentIndex == index;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  child: Semantics(
                    label: item.label,
                    selected: isActive,
                    button: true,
                    child: _NavIcon(asset: item.asset, isActive: isActive),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.asset,
    required this.isActive,
  });

  final String asset;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      height: 52,
      fit: BoxFit.contain,
      color: isActive ? AppColors.primaryText : AppColors.navInactive,
      colorBlendMode: BlendMode.srcIn,
      filterQuality: FilterQuality.high,
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.asset,
    required this.label,
  });

  final String asset;
  final String label;
}
