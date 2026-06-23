import 'package:flutter/material.dart';

import '../models/app_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';
import 'weight_trend_badge.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({
    super.key,
    required this.data,
    this.onLogHydration,
  });

  final InsightData data;
  final VoidCallback? onLogHydration;

  @override
  Widget build(BuildContext context) {
    final calorieProgress = data.calories / data.calorieGoal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Insights',
          style: AppTextStyles.titleLarge.copyWith(fontSize: 20),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(child: _CaloriesCard(data: data, progress: calorieProgress)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: _WeightCard(data: data)),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _HydrationCard(
          percent: data.hydrationPercent,
          logMl: data.hydrationLogMl,
          onLog: onLogHydration,
        ),
      ],
    );
  }
}

class _CaloriesCard extends StatelessWidget {
  const _CaloriesCard({
    required this.data,
    required this.progress,
  });

  final InsightData data;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return _InsightCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: AppTextStyles.metricValue.copyWith(fontSize: 22),
              children: [
                TextSpan(text: '${data.calories} '),
                TextSpan(
                  text: 'Calories',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${data.caloriesRemaining} Remaining',
            style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0', style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
              Text(
                '${data.calorieGoal}',
                style: AppTextStyles.labelSmall.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _CalorieProgressBar(progress: progress.clamp(0.0, 1.0)),
        ],
      ),
    );
  }
}

class _WeightCard extends StatelessWidget {
  const _WeightCard({required this.data});

  final InsightData data;

  @override
  Widget build(BuildContext context) {
    return _InsightCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: AppTextStyles.metricValue.copyWith(fontSize: 22),
              children: [
                TextSpan(text: '${data.weightKg.toInt()} '),
                TextSpan(
                  text: 'kg',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          WeightTrendBadge(changeKg: data.weightChangeKg),
          const Spacer(),
          Text(
            'Weight',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.dialogBackground,
        borderRadius: BorderRadius.circular(AppSpacing.insightCardRadius),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: child,
    );
  }
}

class _CalorieProgressBar extends StatelessWidget {
  const _CalorieProgressBar({required this.progress});

  final double progress;

  static const double _barHeight = 6;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(_barHeight / 2);

    return SizedBox(
      height: _barHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fillWidth = constraints.maxWidth * progress;

          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: constraints.maxWidth,
                height: _barHeight,
                decoration: BoxDecoration(
                  color: AppColors.progressTrack,
                  borderRadius: radius,
                ),
              ),
              if (fillWidth > 0)
                Container(
                  width: fillWidth,
                  height: _barHeight,
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: AppColors.calorieBarGradient,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _HydrationCard extends StatelessWidget {
  const _HydrationCard({
    required this.percent,
    required this.logMl,
    this.onLog,
  });

  final int percent;
  final int logMl;
  final VoidCallback? onLog;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.insightCardRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.dialogBackground,
          border: Border.all(color: AppColors.cardBorder, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xl,
                AppSpacing.lg,
                AppSpacing.xl,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$percent%',
                          style: AppTextStyles.metricValue.copyWith(
                            color: AppColors.hydrationAccent,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Hydration',
                          style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        GestureDetector(
                          onTap: onLog,
                          child: Text(
                            'Log Now',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 136,
                    height: 80,
                    child: _HydrationScale(currentMl: 0),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: AppSpacing.hydrationFooterHeight,
              padding: const EdgeInsets.all(AppSpacing.hydrationFooterPadding),
              decoration: const BoxDecoration(
                color: AppColors.hydrationLogBar,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSpacing.hydrationFooterRadius),
                  bottomRight: Radius.circular(AppSpacing.hydrationFooterRadius),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '$logMl ml added to water log',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 12,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HydrationScale extends StatelessWidget {
  const _HydrationScale({this.currentMl = 0});

  final int currentMl;

  static const int _dashCount = 7;
  static const Set<int> _highlightedIndices = {0, 3, 6};
  static const double _scaleHeight = 64;
  static const double _graphWidth = 136;
  static const double _labelWidth = 18;
  static const double _dashWidth = 8;
  static const double _dashHeight = 2;
  static const double _columnGap = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _graphWidth,
      height: _scaleHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final step = (height - _dashHeight) / (_dashCount - 1);

          double dashTop(int index) => index * step;
          double dashCenterY(int index) => dashTop(index) + _dashHeight / 2;

          final bottomCenterY = dashCenterY(_dashCount - 1);
          final lineStartX = _labelWidth + _columnGap + _dashWidth + _columnGap;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              for (int i = 0; i < _dashCount; i++)
                Positioned(
                  left: _labelWidth + _columnGap,
                  top: dashTop(i),
                  child: _HydrationDash(
                    isHighlighted: _highlightedIndices.contains(i),
                  ),
                ),
              Positioned(
                left: 0,
                top: dashCenterY(0) - 5,
                width: _labelWidth,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('2 L', style: _scaleLabelStyle),
                ),
              ),
              Positioned(
                left: 0,
                top: bottomCenterY - 5,
                width: _labelWidth,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('0 L', style: _scaleLabelStyle),
                ),
              ),
              Positioned(
                left: lineStartX,
                top: bottomCenterY - 0.5,
                right: 28,
                height: 1,
                child: ColoredBox(color: AppColors.hydrationDotMuted),
              ),
              Positioned(
                right: 0,
                top: bottomCenterY - 5,
                child: Text(
                  '${currentMl}ml',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.primaryText,
                    fontSize: 10,
                    height: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TextStyle get _scaleLabelStyle => AppTextStyles.labelSmall.copyWith(
        fontSize: 10,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        height: 1,
      );
}

class _HydrationDash extends StatelessWidget {
  const _HydrationDash({required this.isHighlighted});

  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 2,
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.hydrationAccent : AppColors.hydrationDotMuted,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
