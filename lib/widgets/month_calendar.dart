import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
    this.onPreviousMonth,
    this.onNextMonth,
  });

  final DateTime month;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  static const _dayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  static const _dotArea = 7.0;
  static const _rowGap = 4.0;
  static const _circleSize = 36.0;

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final startWeekday = firstDay.weekday - 1;
    final monthLabel = DateFormat('MMM yyyy').format(month);
    final weekRows = ((startWeekday + daysInMonth + 6) / 7).ceil();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        children: [
          SizedBox(
            height: 32,
            child: Row(
              children: [
                IconButton(
                  onPressed: onPreviousMonth,
                  icon: const Icon(
                    Icons.chevron_left,
                    color: AppColors.primaryText,
                    size: 22,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                Expanded(
                  child: Text(
                    monthLabel,
                    style: AppTextStyles.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: onNextMonth,
                  icon: const Icon(
                    Icons.chevron_right,
                    color: AppColors.primaryText,
                    size: 22,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 14,
            child: Row(
              children: _dayLabels
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columnWidth = constraints.maxWidth / 7;

                return Column(
                  children: List.generate(weekRows, (weekIndex) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: weekIndex < weekRows - 1 ? _rowGap : 0,
                        ),
                        child: LayoutBuilder(
                          builder: (context, rowConstraints) {
                            final rowHeight = rowConstraints.maxHeight;

                            return Row(
                              children: List.generate(7, (dayIndex) {
                                final cellIndex = weekIndex * 7 + dayIndex;
                                final day = cellIndex - startWeekday + 1;

                                if (day < 1 || day > daysInMonth) {
                                  return SizedBox(
                                    width: columnWidth,
                                    height: rowHeight,
                                  );
                                }

                                final date =
                                    DateTime(month.year, month.month, day);
                                final isSelected = _isSameDay(date, selectedDate);

                                return _DayCell(
                                  day: day,
                                  isSelected: isSelected,
                                  columnWidth: columnWidth,
                                  rowHeight: rowHeight,
                                  onTap: () => onDateSelected(date),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.isSelected,
    required this.columnWidth,
    required this.rowHeight,
    required this.onTap,
  });

  final int day;
  final bool isSelected;
  final double columnWidth;
  final double rowHeight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final circleSize = math.min(
      MonthCalendar._circleSize,
      math.min(
        rowHeight - MonthCalendar._dotArea,
        columnWidth - 4,
      ),
    ).clamp(0.0, MonthCalendar._circleSize);

    final textStyle = AppTextStyles.bodyMedium.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
      fontSize: math.min(15, circleSize * 0.45),
      height: 1,
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: columnWidth,
        height: rowHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: isSelected
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.accentGreen,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('$day', style: textStyle),
                        ),
                      ),
                    )
                  : Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('$day', style: textStyle),
                      ),
                    ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: 5,
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.accentGreen : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
