import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_state.dart';
import '../widgets/app_bottom_nav_bar.dart';
import 'calendar_bottom_sheet.dart';
import 'mood_screen.dart';
import 'nutrition_screen.dart';
import 'profile_screen.dart';
import 'training_calendar_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _nutritionNavigatorKey = GlobalKey<NavigatorState>();
  final Set<int> _builtTabs = {0};
  bool _calendarOpen = false;

  void _ensureTabBuilt(int index) {
    if (_builtTabs.add(index)) {
      setState(() {});
    }
  }

  void _openCalendarOverlay() {
    setState(() => _calendarOpen = true);
  }

  void _closeCalendarOverlay() {
    setState(() => _calendarOpen = false);
  }

  void _onTabTap(int index) {
    _ensureTabBuilt(index);
    context.read<AppState>().setTab(index);
  }

  void _switchToPlanTab() {
    _ensureTabBuilt(1);
    context.read<AppState>().setTab(1);
  }

  Widget _lazyTab(int index, Widget child) {
    if (!_builtTabs.contains(index)) {
      return const SizedBox.shrink();
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = context.watch<AppState>().currentTab;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          IndexedStack(
            index: currentTab,
            children: [
              _lazyTab(
                0,
                _NutritionTab(
                  navigatorKey: _nutritionNavigatorKey,
                  onWorkoutTap: _switchToPlanTab,
                  onWeekTap: _openCalendarOverlay,
                ),
              ),
              _lazyTab(1, const TrainingCalendarScreen(isTabRoot: true)),
              _lazyTab(2, const MoodScreen()),
              _lazyTab(3, const ProfileScreen()),
            ],
          ),
          if (_calendarOpen)
            CalendarBottomSheet(onDismiss: _closeCalendarOverlay),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentTab,
        onTap: _onTabTap,
      ),
    );
  }
}

class _NutritionTab extends StatelessWidget {
  const _NutritionTab({
    required this.navigatorKey,
    required this.onWorkoutTap,
    this.onWeekTap,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onWorkoutTap;
  final VoidCallback? onWeekTap;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => NutritionScreen(
            onWorkoutTap: onWorkoutTap,
            onCalendarTap: onWeekTap,
          ),
        );
      },
    );
  }
}
