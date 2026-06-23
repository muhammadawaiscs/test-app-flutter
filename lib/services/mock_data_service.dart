import '../models/app_models.dart';
import '../models/training_models.dart';

class MockDataService {
  static const featuredWorkout = Workout(
    title: 'Upper Body',
    dateRange: 'December 22',
    duration: '25m',
    totalDuration: '30m',
  );

  static const insights = InsightData(
    calories: 550,
    caloriesRemaining: 1950,
    calorieGoal: 2500,
    weightKg: 75,
    weightChangeKg: 1.6,
    hydrationPercent: 0,
    hydrationLogMl: 500,
  );

  static List<CalendarDay> weekDays(DateTime selected) {
    const labels = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
    final start = DateTime(2024, 12, 21);

    return List.generate(7, (index) {
      final date = start.add(Duration(days: index));
      return CalendarDay(
        date: date,
        dayLabel: labels[index],
        isSelected: _isSameDay(date, selected),
        hasWorkout: false,
      );
    });
  }

  static List<TrainingWeek> trainingWeeks() {
    return [
      const TrainingWeek(
        weekNumber: 2,
        totalWeeks: 8,
        dateRange: 'December 8-14',
        days: [
          TrainingDay(
            dayLabel: 'Mon',
            dayNumber: 8,
            session: TrainingSession(
              title: 'Arm Blaster',
              duration: '25m',
              totalDuration: '30m',
              durationMinutes: 30,
              category: WorkoutCategory.arms,
            ),
          ),
          TrainingDay(dayLabel: 'Tue', dayNumber: 9),
          TrainingDay(dayLabel: 'Wed', dayNumber: 10),
          TrainingDay(
            dayLabel: 'Thu',
            dayNumber: 11,
            session: TrainingSession(
              title: 'Leg Day Blitz',
              duration: '25m',
              totalDuration: '30m',
              durationMinutes: 30,
              category: WorkoutCategory.legs,
            ),
          ),
          TrainingDay(dayLabel: 'Fri', dayNumber: 12),
          TrainingDay(dayLabel: 'Sat', dayNumber: 13),
          TrainingDay(dayLabel: 'Sun', dayNumber: 14),
        ],
      ),
      const TrainingWeek(
        weekNumber: 2,
        displayLabel: 'Week 2',
        dateRange: 'December 14-22',
        days: [
          TrainingDay(dayLabel: 'Mon', dayNumber: 14),
          TrainingDay(dayLabel: 'Tue', dayNumber: 15),
          TrainingDay(dayLabel: 'Wed', dayNumber: 16),
          TrainingDay(dayLabel: 'Thu', dayNumber: 17),
          TrainingDay(
            dayLabel: 'Fri',
            dayNumber: 13,
            session: TrainingSession(
              title: 'Descending Hi Reps',
              duration: '',
              totalDuration: '',
              category: WorkoutCategory.intervals,
              showLeftAccent: false,
              rightLabel: '6km',
            ),
          ),
          TrainingDay(dayLabel: 'Sat', dayNumber: 19),
          TrainingDay(dayLabel: 'Sun', dayNumber: 20),
        ],
      ),
    ];
  }

  static const moodOptions = [
    MoodOption(
      type: MoodType.calm,
      label: 'Calm',
      faceAsset: 'assets/moods/mood_calm.png',
      angle: 0.75,
    ),
    MoodOption(
      type: MoodType.content,
      label: 'Content',
      faceAsset: 'assets/moods/mood_content.png',
      angle: 0.25,
    ),
    MoodOption(
      type: MoodType.peaceful,
      label: 'Peaceful',
      faceAsset: 'assets/moods/mood_peaceful.png',
      angle: 0.5,
    ),
    MoodOption(
      type: MoodType.happy,
      label: 'Happy',
      faceAsset: 'assets/moods/mood_happy.png',
      angle: 0.0,
    ),
  ];

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
