import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _userName = 'Test User';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              AppSpacing.sm,
              AppSpacing.screenPadding,
              AppSpacing.xxxl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile', style: AppTextStyles.displayLarge),
                const SizedBox(height: AppSpacing.xxl),
                _ProfileHeader(userName: _userName),
                const SizedBox(height: AppSpacing.xxl),
                const _StatsRow(),
                const SizedBox(height: AppSpacing.xxl),
                Text('Account', style: AppTextStyles.titleMedium),
                const SizedBox(height: AppSpacing.md),
                const _ProfileTile(
                  icon: Icons.fitness_center,
                  title: 'Workout History',
                  subtitle: '24 sessions completed',
                ),
                const _ProfileTile(
                  icon: Icons.emoji_events_outlined,
                  title: 'Achievements',
                  subtitle: '8 badges earned',
                ),
                const _ProfileTile(
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

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.userName});

  final String userName;

  String get _initials {
    final parts = userName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return userName.isNotEmpty ? userName[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardElevated,
              border: Border.all(
                color: AppColors.accentGreen,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              _initials,
              style: AppTextStyles.avatarInitials,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            userName,
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '@testuser',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.tertiaryText),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.armsBadgeBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Fitness Enthusiast',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.armsBadgeForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(label: 'Workouts', value: '24'),
        ),
        SizedBox(width: AppSpacing.md),
        Expanded(
          child: _StatCard(label: 'Streak', value: '12d'),
        ),
        SizedBox(width: AppSpacing.md),
        Expanded(
          child: _StatCard(label: 'Badges', value: '8'),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.statValue),
          const SizedBox(height: AppSpacing.xs),
          Text(label, style: AppTextStyles.labelSmall),
        ],
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
        border: Border.all(color: AppColors.cardBorder),
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
