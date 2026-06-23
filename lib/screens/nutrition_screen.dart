import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../services/app_state.dart';
import '../services/mock_data_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../widgets/date_header.dart';
import '../widgets/insights_section.dart';
import '../widgets/workout_card.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({
    super.key,
    this.onCalendarTap,
    this.onWorkoutTap,
  });

  final VoidCallback? onCalendarTap;
  final VoidCallback? onWorkoutTap;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final weekDays = MockDataService.weekDays(appState.selectedDate);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
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
                NutritionHeader(onWeekTap: onCalendarTap),
                const SizedBox(height: AppSpacing.lg),
                TodayLabel(selectedDate: appState.selectedDate),
                const SizedBox(height: AppSpacing.lg),
                DateStrip(
                  days: weekDays,
                  onDaySelected: appState.selectDate,
                ),
                const CalendarSectionDivider(),
                WorkoutsSection(
                  workout: MockDataService.featuredWorkout,
                  onWorkoutTap: onWorkoutTap,
                ),
                const SizedBox(height: AppSpacing.xxl),
                InsightsSection(
                  data: appState.insights,
                  onLogHydration: appState.logHydration,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
