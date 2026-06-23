class Workout {
  const Workout({
    required this.title,
    required this.dateRange,
    required this.duration,
    required this.totalDuration,
  });

  final String title;
  final String dateRange;
  final String duration;
  final String totalDuration;
}

class InsightData {
  const InsightData({
    required this.calories,
    required this.caloriesRemaining,
    required this.calorieGoal,
    required this.weightKg,
    required this.weightChangeKg,
    required this.hydrationPercent,
    required this.hydrationLogMl,
  });

  final int calories;
  final int caloriesRemaining;
  final int calorieGoal;
  final double weightKg;
  final double weightChangeKg;
  final int hydrationPercent;
  final int hydrationLogMl;
}

class CalendarDay {
  const CalendarDay({
    required this.date,
    required this.dayLabel,
    required this.isSelected,
    required this.hasWorkout,
  });

  final DateTime date;
  final String dayLabel;
  final bool isSelected;
  final bool hasWorkout;
}

enum MoodType { calm, content, peaceful, happy }

class MoodOption {
  const MoodOption({
    required this.type,
    required this.label,
    required this.faceAsset,
    required this.angle,
  });

  final MoodType type;
  final String label;
  final String faceAsset;
  final double angle;
}
