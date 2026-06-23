import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/app_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class NutritionHeader extends StatelessWidget {
  const NutritionHeader({super.key, this.onWeekTap});

  final VoidCallback? onWeekTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.primaryText,
                size: 24,
              ),
            ),
          ),
          GestureDetector(
            onTap: onWeekTap,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.access_time, size: 14, color: AppColors.secondaryText),
                const SizedBox(width: AppSpacing.xs),
                Text('Week 1/4', style: AppTextStyles.bodyMedium),
                const SizedBox(width: AppSpacing.xs),
                const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.secondaryText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TodayLabel extends StatelessWidget {
  const TodayLabel({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final formatted = DateFormat('d MMM yyyy').format(selectedDate);
    return Text(
      'Today, $formatted',
      style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class DateHeader extends StatelessWidget {
  const DateHeader({
    super.key,
    required this.selectedDate,
    this.onWeekTap,
  });

  final DateTime selectedDate;
  final VoidCallback? onWeekTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NutritionHeader(onWeekTap: onWeekTap),
        const SizedBox(height: AppSpacing.lg),
        TodayLabel(selectedDate: selectedDate),
      ],
    );
  }
}

class DateStrip extends StatelessWidget {
  const DateStrip({
    super.key,
    required this.days,
    required this.onDaySelected,
  });

  final List<CalendarDay> days;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: days.map((day) {
        return Expanded(
          child: _DateStripItem(
            day: day,
            onTap: () => onDaySelected(day.date),
          ),
        );
      }).toList(),
    );
  }
}

class CalendarSectionDivider extends StatelessWidget {
  const CalendarSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Center(
        child: Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFF3A3548),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

class _DateStripItem extends StatelessWidget {
  const _DateStripItem({required this.day, required this.onTap});

  final CalendarDay day;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Text(
            day.dayLabel,
            style: AppTextStyles.labelSmall.copyWith(
              color: day.isSelected ? AppColors.accentGreen : AppColors.primaryText,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dateCircle,
              border: day.isSelected
                  ? Border.all(color: AppColors.accentGreen, width: 2)
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '${day.date.day}',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primaryText,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: day.isSelected ? AppColors.accentGreen : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
