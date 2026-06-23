import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
        height: 1.2,
      );

  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
        height: 1.3,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryText,
        height: 1.3,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryText,
        height: 1.4,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryText,
        height: 1.4,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryText,
        height: 1.3,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryText,
        height: 1.2,
        letterSpacing: 0.2,
      );

  static TextStyle get metricValue => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
        height: 1.1,
      );

  static TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
        height: 1.2,
      );
}
