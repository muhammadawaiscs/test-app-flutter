import 'package:flutter/material.dart';

import '../models/training_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class TrainingWeekHeader extends StatelessWidget {
  const TrainingWeekHeader({super.key, required this.week});

  final TrainingWeek week;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(week.label, style: AppTextStyles.weekTitle),
            const Spacer(),
            Text(
              'Total: ${week.totalMinutes}min',
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(week.dateRange, style: AppTextStyles.bodySmall),
      ],
    );
  }
}

class TrainingWeekSection extends StatelessWidget {
  const TrainingWeekSection({super.key, required this.week});

  final TrainingWeek week;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrainingWeekHeader(week: week),
        const SizedBox(height: AppSpacing.lg),
        TrainingDayList(week: week),
      ],
    );
  }
}

class TrainingWeekDivider extends StatelessWidget {
  const TrainingWeekDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Container(
        height: AppSpacing.planWeekDividerThickness,
        color: AppColors.planWeekDivider,
      ),
    );
  }
}

class TrainingDayList extends StatelessWidget {
  const TrainingDayList({super.key, required this.week});

  final TrainingWeek week;

  /// Slight slot height for empty days so row gaps match workout weeks.
  static const emptyDayHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < week.days.length; i++) ...[
          _TrainingDayRow(day: week.days[i]),
          if (i < week.days.length - 1)
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.divider,
            ),
        ],
      ],
    );
  }
}

class _TrainingDayRow extends StatelessWidget {
  const _TrainingDayRow({required this.day});

  final TrainingDay day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day.dayLabel, style: AppTextStyles.bodySmall),
                Text(
                  '${day.dayNumber}',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: day.session == null
                ? const SizedBox(height: TrainingDayList.emptyDayHeight)
                : _TrainingWorkoutCard(session: day.session!),
          ),
        ],
      ),
    );
  }
}

class _TrainingWorkoutCard extends StatelessWidget {
  const _TrainingWorkoutCard({required this.session});

  final TrainingSession session;

  static const _minCardHeight = 68.0;

  @override
  Widget build(BuildContext context) {
    final rightText =
        session.rightLabel ?? '${session.duration} - ${session.totalDuration}';

    return Container(
      constraints: const BoxConstraints(minHeight: _minCardHeight),
      decoration: BoxDecoration(
        color: AppColors.dialogBackground,
        borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (session.showLeftAccent)
              const _LeftAccent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: const Center(child: _DragHandle()),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  AppSpacing.sm,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (session.category != null) ...[
                      _CategoryBadge(category: session.category!),
                      const SizedBox(height: AppSpacing.xs),
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            session.title,
                            style: AppTextStyles.trainingSessionTitle,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          rightText,
                          style: AppTextStyles.trainingSessionMeta,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeftAccent extends StatelessWidget {
  const _LeftAccent();

  static const _barWidth = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _barWidth,
      decoration: BoxDecoration(
        color: AppColors.primaryText,
        borderRadius: BorderRadius.circular(_barWidth / 2),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(2, (col) {
              return Container(
                width: 4,
                height: 4,
                margin: EdgeInsets.only(right: col == 0 ? 4 : 0),
                decoration: const BoxDecoration(
                  color: AppColors.secondaryText,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});

  final WorkoutCategory category;

  @override
  Widget build(BuildContext context) {
    final (background, foreground, label, icon) = switch (category) {
      WorkoutCategory.arms => (
          AppColors.armsBadgeBackground,
          AppColors.armsBadgeForeground,
          'Arms Workout',
          Icons.fitness_center,
        ),
      WorkoutCategory.legs => (
          AppColors.legsBadgeBackground,
          AppColors.legsBadgeForeground,
          'Leg Workout',
          Icons.directions_run,
        ),
      WorkoutCategory.intervals => (
          AppColors.intervalsBadgeBackground,
          AppColors.intervalsBadgeText,
          'Intervals',
          Icons.directions_run,
        ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: foreground),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.categoryBadge.copyWith(color: foreground),
            ),
          ],
        ),
      ),
    );
  }
}
