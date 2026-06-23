import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:test_app/main.dart';
import 'package:test_app/services/app_state.dart';

void main() {
  testWidgets('app loads nutrition screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const TestApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Workouts'), findsOneWidget);
    expect(find.text('My Insights'), findsOneWidget);
    expect(find.textContaining('Today,'), findsOneWidget);
    expect(find.bySemanticsLabel('Nutrition'), findsOneWidget);
  });
}
