import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      surface: AppColors.background,
      onSurface: AppColors.primaryText,
      primary: AppColors.accentGreen,
      secondary: AppColors.workoutAccent,
      surfaceTint: Colors.transparent,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelSmall: AppTextStyles.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.dialogBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
      splashColor: Colors.white12,
      highlightColor: Colors.white10,
    );
  }
}
