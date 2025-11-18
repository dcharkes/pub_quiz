// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:pub_quiz_player/main.dart';
import 'package:pub_quiz_player/src/services/persistence_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final persistenceService = PersistenceService(prefs);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(persistenceService: persistenceService));

    // Verify that our counter starts at 0.
    // Note: The original test was for the counter app.
    // Our new app starts at EnterGameIdScreen.
    // So this test will fail if we look for counter.
    // Let's update it to check for "Enter Game ID".
    expect(find.text('Enter Game ID'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
