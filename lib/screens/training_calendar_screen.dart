import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/mock_data_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';
import '../widgets/training_week_card.dart';

class TrainingCalendarScreen extends StatelessWidget {
  const TrainingCalendarScreen({
    super.key,
    this.isTabRoot = false,
  });

  final bool isTabRoot;

  @override
  Widget build(BuildContext context) {
    final weeks = MockDataService.trainingWeeks();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenPadding,
                  AppSpacing.md,
                  AppSpacing.screenPadding,
                  AppSpacing.lg,
                ),
                child: Row(
                  children: [
                    if (!isTabRoot)
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    Expanded(
                      child: Text(
                        'Training Calendar',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign:
                            isTabRoot ? TextAlign.left : TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Training plan saved',
                              style: AppTextStyles.bodyMedium,
                            ),
                            backgroundColor: AppColors.cardElevated,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        if (!isTabRoot) Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Save',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: AppSpacing.planHeaderDividerThickness,
                thickness: AppSpacing.planHeaderDividerThickness,
                color: AppColors.planHeaderDivider,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: AppSpacing.xl,
                    bottom: AppSpacing.xxxl,
                  ),
                  children: [
                    for (var i = 0; i < weeks.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenPadding,
                        ),
                        child: TrainingWeekSection(week: weeks[i]),
                      ),
                      if (i < weeks.length - 1) const TrainingWeekDivider(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
