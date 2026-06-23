import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MoodBackground extends StatelessWidget {
  const MoodBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.moodBackgroundBase,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.05, -0.78),
                radius: 1.05,
                colors: [
                  AppColors.moodGlowIndigo,
                  AppColors.moodGlowIndigoDeep,
                  AppColors.moodEdgeTealCharcoal,
                  AppColors.moodBackgroundBase,
                ],
                stops: [0.0, 0.32, 0.62, 1.0],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(1.05, -0.82),
                radius: 0.72,
                colors: [
                  AppColors.moodEdgeTealCharcoal,
                  AppColors.moodEdgeNearBlack,
                  AppColors.moodBackgroundBase,
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.moodVignetteCharcoal,
                  AppColors.moodBackgroundBase,
                ],
                stops: [0.38, 0.72, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
