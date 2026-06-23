import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/app_models.dart';
import '../services/app_state.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';
import '../widgets/mood_background.dart';
import '../widgets/mood_selector.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  static const double _defaultSelectorSize = 280;
  static const double _selectorHeightRatio = 328 / 280;

  static double _selectorSizeFor(BoxConstraints constraints) {
    final byHeight = constraints.maxHeight / _selectorHeightRatio;
    final byWidth = constraints.maxWidth;
    return math.min(
      _defaultSelectorSize,
      math.min(byHeight, byWidth),
    ).clamp(140.0, _defaultSelectorSize);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final mood = appState.currentMoodOption;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

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
                      child: isLandscape
                          ? _LandscapeContent(
                              appState: appState,
                              mood: mood,
                            )
                          : _PortraitContent(
                              appState: appState,
                              mood: mood,
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.sm,
                      0,
                      AppSpacing.sm,
                      isLandscape ? AppSpacing.sm : AppSpacing.lg,
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

class _MoodHeader extends StatelessWidget {
  const _MoodHeader({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!compact) const SizedBox(height: AppSpacing.lg),
        Text('Mood', style: AppTextStyles.displayLarge),
        SizedBox(height: compact ? AppSpacing.xs : AppSpacing.sm),
        Text('Start your day', style: AppTextStyles.bodySmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'How are you feeling at the Moment?',
          style: AppTextStyles.moodQuestion,
        ),
      ],
    );
  }
}

class _PortraitContent extends StatelessWidget {
  const _PortraitContent({
    required this.appState,
    required this.mood,
  });

  final AppState appState;
  final MoodOption mood;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _MoodHeader(),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = MoodScreen._selectorSizeFor(constraints);
              return Center(
                child: MoodSelector(
                  size: size,
                  value: appState.moodValue,
                  mood: mood,
                  onChanged: appState.setMoodValue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LandscapeContent extends StatelessWidget {
  const _LandscapeContent({
    required this.appState,
    required this.mood,
  });

  final AppState appState;
  final MoodOption mood;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: _MoodHeader(compact: true),
          ),
        ),
        Expanded(
          flex: 2,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = MoodScreen._selectorSizeFor(constraints);
              return Center(
                child: MoodSelector(
                  size: size,
                  value: appState.moodValue,
                  mood: mood,
                  onChanged: appState.setMoodValue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
