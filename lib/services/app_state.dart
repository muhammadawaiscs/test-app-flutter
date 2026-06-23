import 'package:flutter/material.dart';

import '../models/app_models.dart';
import '../services/mock_data_service.dart';

class AppState extends ChangeNotifier {
  int _currentTab = 0;
  DateTime _selectedDate = DateTime(2024, 12, 22);
  MoodType _selectedMood = MoodType.calm;
  double _moodValue = 0.75;
  int _hydrationPercent = 0;

  int get currentTab => _currentTab;
  DateTime get selectedDate => _selectedDate;
  MoodType get selectedMood => _selectedMood;
  double get moodValue => _moodValue;
  int get hydrationPercent => _hydrationPercent;

  InsightData get insights => MockDataService.insights.copyWith(
        hydrationPercent: _hydrationPercent,
      );

  MoodOption get currentMoodOption {
    final options = MockDataService.moodOptions;
    MoodOption closest = options.first;
    var minDistance = double.infinity;

    for (final option in options) {
      final distance = (option.angle - _moodValue).abs();
      if (distance < minDistance) {
        minDistance = distance;
        closest = option;
      }
    }
    return closest;
  }

  void setTab(int index) {
    if (_currentTab == index) return;
    _currentTab = index;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setMoodValue(double value) {
    _moodValue = value.clamp(0.0, 1.0);
    _selectedMood = currentMoodOption.type;
    notifyListeners();
  }

  void logHydration() {
    _hydrationPercent = (_hydrationPercent + 25).clamp(0, 100);
    notifyListeners();
  }
}

extension on InsightData {
  InsightData copyWith({int? hydrationPercent}) {
    return InsightData(
      calories: calories,
      caloriesRemaining: caloriesRemaining,
      calorieGoal: calorieGoal,
      weightKg: weightKg,
      weightChangeKg: weightChangeKg,
      hydrationPercent: hydrationPercent ?? this.hydrationPercent,
      hydrationLogMl: hydrationLogMl,
    );
  }
}
