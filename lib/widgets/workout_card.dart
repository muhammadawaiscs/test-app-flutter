import 'package:flutter/material.dart';

import '../models/app_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.workout,
    this.onTap,
  });

  final Workout workout;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.dialogBackground,
            border: Border.all(color: AppColors.cardBorder, width: 0.5),
            borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 5,
                  color: AppColors.workoutAccent,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      AppSpacing.lg,
                      AppSpacing.md,
                      AppSpacing.lg,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${workout.dateRange} - ${workout.duration} - ${workout.totalDuration}',
                                style: AppTextStyles.workoutMeta,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                workout.title,
                                style: AppTextStyles.workoutTitle,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryText,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutsSection extends StatelessWidget {
  const WorkoutsSection({
    super.key,
    required this.workout,
    this.onWorkoutTap,
  });

  final Workout workout;
  final VoidCallback? onWorkoutTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Workouts', style: AppTextStyles.sectionTitle),
            const Spacer(),
            const Icon(
              Icons.wb_sunny_outlined,
              color: AppColors.secondaryText,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '9°',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        WorkoutCard(workout: workout, onTap: onWorkoutTap),
      ],
    );
  }
}
