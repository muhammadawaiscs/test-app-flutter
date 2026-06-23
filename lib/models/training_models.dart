enum WorkoutCategory {
  arms,
  legs,
  intervals,
}

class TrainingDay {
  const TrainingDay({
    required this.dayLabel,
    required this.dayNumber,
    this.session,
  });

  final String dayLabel;
  final int dayNumber;
  final TrainingSession? session;
}

class TrainingWeek {
  const TrainingWeek({
    required this.weekNumber,
    required this.dateRange,
    required this.days,
    this.totalWeeks,
    this.displayLabel,
  });

  final int weekNumber;
  final int? totalWeeks;
  final String dateRange;
  final List<TrainingDay> days;
  final String? displayLabel;

  String get label =>
      displayLabel ??
      (totalWeeks != null ? 'Week $weekNumber/$totalWeeks' : 'Week $weekNumber');

  int get totalMinutes => days
      .where((day) => day.session != null && !day.session!.isRestDay)
      .fold(0, (sum, day) => sum + (day.session?.durationMinutes ?? 0));
}

class TrainingSession {
  const TrainingSession({
    required this.title,
    required this.duration,
    required this.totalDuration,
    this.durationMinutes = 0,
    this.isRestDay = false,
    this.category,
    this.showLeftAccent = true,
    this.rightLabel,
  });

  final String title;
  final String duration;
  final String totalDuration;
  final int durationMinutes;
  final bool isRestDay;
  final WorkoutCategory? category;
  final bool showLeftAccent;
  final String? rightLabel;
}
