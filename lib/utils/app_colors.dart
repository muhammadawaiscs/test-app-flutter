import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color dialogBackground = Color(0xFF2C2C2E);
  static const Color calendarSheetBackground = Color(0xFF1C1C1E);
  static const Color card = dialogBackground;
  static const Color cardElevated = Color(0xFF3A3A3C);
  static const Color dateCircle = Color(0xFF3A3A3C);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFC7C7CC);
  static const Color tertiaryText = Color(0xFF98989D);
  static const Color accentGreen = Color(0xFF24D07A);
  static const Color workoutAccent = Color(0xFF3BC4D4);
  static const Color accentTeal = Color(0xFF3DDBA5);
  static const Color accentBlue = Color(0xFF6BB4FF);
  static const Color hydrationAccent = Color(0xFF52B0F0);
  static const Color hydrationDotMuted = Color(0xFF5A6D85);
  static const Color hydrationDotActive = Color(0xFF52B0F0);
  static const Color accentCyan = Color(0xFF3DDBF0);
  static const Color navInactive = Color(0xFF98989D);
  static const Color divider = Color(0xFF545456);
  static const Color planHeaderDivider = Color(0xFF4955DF);
  static const Color planWeekDivider = Color(0xFF17AA99);
  static const Color armsBadgeBackground = Color(0xFF0F2419);
  static const Color armsBadgeForeground = Color(0xFF1FB76F);
  static const Color legsBadgeBackground = Color(0xFF12122B);
  static const Color legsBadgeForeground = Color(0xFF5D68D1);
  static const Color intervalsBadgeBackground = Color(0xFF3A3A3C);
  static const Color intervalsBadgeText = Color(0xFFC7C7CC);
  static const Color hydrationBar = Color(0xFF1A5C56);
  static const Color hydrationLogBar = Color(0xFF266878);
  static const Color progressTrack = Color(0xFF545456);
  static const Color cardBorder = Color(0xFF48484A);

  static const Color moodBackgroundBase = Color(0xFF05080A);
  static const Color moodGlowIndigo = Color(0xFF1D2D49);
  static const Color moodGlowIndigoDeep = Color(0xFF16253F);
  static const Color moodEdgeTealCharcoal = Color(0xFF0C181E);
  static const Color moodEdgeNearBlack = Color(0xFF0A1115);
  static const Color moodVignetteCharcoal = Color(0xFF070C10);

  static const List<Color> calorieBarGradient = [
    Color(0xFF9AD4F5),
    Color(0xFF7ADCC4),
    Color(0xFF66E0A8),
  ];

  static const Color moodContentOrange = Color(0xFFFA9D61);
  static const Color moodPeacefulTeal = Color(0xFF6FB9AC);
  static const Color moodHappyPurple = Color(0xFFC9BCEF);
  static const Color moodHappyPink = Color(0xFFE88FA8);
  static const Color moodRosePink = Color(0xFFF38EAF);

  /// 15 segments: 4 teal → 4 purple → 2 pink → 1 rose → 4 orange.
  static const List<Color> moodRingSegments = [
    moodPeacefulTeal,
    moodPeacefulTeal,
    moodPeacefulTeal,
    moodPeacefulTeal,
    moodHappyPurple,
    moodHappyPurple,
    moodHappyPurple,
    moodHappyPurple,
    moodHappyPink,
    moodHappyPink,
    moodRosePink,
    moodContentOrange,
    moodContentOrange,
    moodContentOrange,
    moodContentOrange,
  ];

  static const List<Color> moodGradient = moodRingSegments;
}
