import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.xxxl),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.card,
                    border: Border.all(color: AppColors.divider, width: 2),
                  ),
                  child: const Icon(Icons.person, size: 48, color: AppColors.secondaryText),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text('Alex Morgan', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                Text('Fitness Enthusiast', style: AppTextStyles.bodySmall),
                const SizedBox(height: AppSpacing.xxxl),
                _ProfileTile(
                  icon: Icons.fitness_center,
                  title: 'Workout History',
                  subtitle: '24 sessions completed',
                ),
                _ProfileTile(
                  icon: Icons.emoji_events_outlined,
                  title: 'Achievements',
                  subtitle: '8 badges earned',
                ),
                _ProfileTile(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  subtitle: 'Notifications, units, privacy',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.cardElevated,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.accentCyan, size: 22),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.secondaryText),
        ],
      ),
    );
  }
}
