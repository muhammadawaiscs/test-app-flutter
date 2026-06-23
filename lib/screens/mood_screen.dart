import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../services/app_state.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';
import '../widgets/mood_background.dart';
import '../widgets/mood_selector.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final mood = appState.currentMoodOption;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.moodBackgroundBase,
        body: Stack(
          children: [
            const Positioned.fill(child: MoodBackground()),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppSpacing.lg),
                          Text('Mood', style: AppTextStyles.displayLarge),
                          const SizedBox(height: AppSpacing.sm),
                          Text('Start your day', style: AppTextStyles.bodySmall),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'How are you feeling at the Moment?',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Center(
                            child: MoodSelector(
                              value: appState.moodValue,
                              mood: mood,
                              onChanged: appState.setMoodValue,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.sm,
                      0,
                      AppSpacing.sm,
                      AppSpacing.lg,
                    ),
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Mood logged: ${mood.label}',
                                style: AppTextStyles.bodyMedium,
                              ),
                              backgroundColor: AppColors.cardElevated,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryText,
                          foregroundColor: AppColors.background,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text('Continue', style: AppTextStyles.button),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
