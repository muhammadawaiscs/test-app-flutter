import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_state.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../widgets/month_calendar.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({
    super.key,
    required this.onDismiss,
  });

  final VoidCallback onDismiss;

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late DateTime _displayedMonth;

  @override
  void initState() {
    super.initState();
    final selected = context.read<AppState>().selectedDate;
    _displayedMonth = DateTime(selected.year, selected.month);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      reverseDuration: const Duration(milliseconds: 220),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeMonth(int offset) {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + offset,
      );
    });
  }

  Future<void> _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final sheetHeight =
            constraints.maxHeight * AppSpacing.calendarSheetHeightFraction;

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: FadeTransition(
                opacity: _controller,
                child: GestureDetector(
                  onTap: _dismiss,
                  behavior: HitTestBehavior.opaque,
                  child: ColoredBox(
                    color: Colors.black.withValues(alpha: 0.55),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: sheetHeight,
              child: SlideTransition(
                position: _slideAnimation,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.calendarSheetBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSpacing.calendarSheetTopRadius),
                      topRight: Radius.circular(AppSpacing.calendarSheetTopRadius),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.sm),
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.divider,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Expanded(
                          child: MonthCalendar(
                            month: _displayedMonth,
                            selectedDate: appState.selectedDate,
                            onPreviousMonth: () => _changeMonth(-1),
                            onNextMonth: () => _changeMonth(1),
                            onDateSelected: (date) {
                              appState.selectDate(date);
                              _dismiss();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
