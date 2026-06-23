import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Figma typography tokens — Inter family, sizes/weights from Test-Task design.
abstract final class AppTextStyles {
  static const String fontFamily = 'Inter';

  // --- Base scale (Figma) ---

  /// 28 / Bold — Mood title, Profile title
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.2,
  );

  /// 22 / Bold — Training Calendar, user name
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 18 / SemiBold — card titles, week labels
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 16 / Medium — Today date, body emphasis
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  /// 14 / Medium — week selector, hydration label
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  /// 12 / Medium — captions, subtitles
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    height: 1.3,
  );

  /// 11 / SemiBold — date strip labels, badges
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
    height: 1.2,
    letterSpacing: 0.2,
  );

  /// 24 / Bold — default metric values
  static const TextStyle metricValue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.1,
  );

  /// 16 / SemiBold — primary buttons
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
    height: 1.2,
  );

  // --- Screen-specific tokens (Figma) ---

  /// 20 / Bold — "Workouts", "My Insights"
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 22 / Bold — calorie & weight numbers
  static const TextStyle insightMetric = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.1,
  );

  /// 14 / Medium — "Calories", "kg" suffix
  static const TextStyle insightUnit = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  /// 28 / Bold — hydration percentage
  static const TextStyle hydrationMetric = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.hydrationAccent,
    height: 1.1,
  );

  /// 17 / SemiBold — workout card title
  static const TextStyle workoutTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 12 / Regular — workout date/duration line
  static const TextStyle workoutMeta = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 11 / SemiBold — date strip day label (M, TU, W…)
  static const TextStyle dateDayLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  /// 14 / SemiBold — date strip day number
  static const TextStyle dateDayNumber = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.4,
  );

  /// 10 / SemiBold — progress bar min/max labels
  static const TextStyle progressLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
    height: 1.2,
    letterSpacing: 0.2,
  );

  /// 13 / Medium — card footer labels ("Weight")
  static const TextStyle cardLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 16 / SemiBold — training session title
  static const TextStyle trainingSessionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  /// 13 / Medium — training session duration
  static const TextStyle trainingSessionMeta = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 11 / Medium — category badge text
  static const TextStyle categoryBadge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    height: 1,
  );

  /// 16 / Regular — mood question subtitle
  static const TextStyle moodQuestion = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 1.4,
  );

  /// 12 / SemiBold — weight trend "+1.6kg"
  static const TextStyle weightTrend = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.accentGreen,
    height: 1.3,
  );

  /// 30 / SemiBold — profile avatar initials
  static const TextStyle avatarInitials = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
    letterSpacing: 0.5,
  );

  /// 20 / Bold — profile stat values
  static const TextStyle statValue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.1,
  );

  /// 18 / Bold — training week header
  static const TextStyle weekTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.3,
  );

  /// 10 / Medium — hydration scale labels
  static const TextStyle scaleLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1,
  );

  /// 11 / Medium — calendar weekday headers
  static const TextStyle calendarWeekdayLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    height: 1.2,
  );
}
