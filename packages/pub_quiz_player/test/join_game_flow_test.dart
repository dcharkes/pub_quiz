import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pub_quiz_player/main.dart';
import 'package:pub_quiz_player/src/services/persistence_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Full Join Game Flow Test', (WidgetTester tester) async {
    // 1. Setup Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final persistenceService = PersistenceService(prefs);

    // 2. Start App
    await tester.pumpWidget(
      MyApp(
        persistenceService: persistenceService,
      ),
    );
    await tester.pumpAndSettle();

    // 3. Verify we are on EnterGameIdScreen
    expect(find.text('Enter Game ID'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // 4. Enter Game ID and Submit
    await tester.enterText(find.byType(TextField), 'test-game');
    await tester.tap(find.text('Next'));
    
    // Wait for navigation and async client connection
    await tester.pumpAndSettle();

    // 5. Verify we are on JoinGameScreen
    expect(find.text('Join Game: test-game'), findsOneWidget);
    expect(find.text('Your Name'), findsOneWidget);
    // Verify Quiz Title from FakeClient
    expect(find.text('Dart & Flutter Fundamentals'), findsOneWidget);

    // 6. Enter Name and Join
    await tester.enterText(find.byType(TextField), 'Player1');
    await tester.tap(find.text('Join'));
    await tester.pumpAndSettle();

    // 7. Verify we are on GameScreen
    // Because the user might have set the client to start immediately for 
    // debugging, we check for either the waiting text OR the first question.
    // However, since we know it starts immediately now, we'll check for the
    // first question.
    // expect(find.text('The game will start soon...'), findsOneWidget);
    expect(find.text('What is Dart primarily used for?'), findsOneWidget);
    // expect(find.text('Game ID: test-game'), findsOneWidget); // Game ID is not shown in new UI

    // 8. Verify Persistence
    expect(persistenceService.savedGameId, 'test-game');
    expect(persistenceService.savedPlayerName, 'Player1');

    // 9. Restart App (Simulate Refresh)
    // We need to rebuild the app with the same persistence service
    // (which now has data)
    await tester.pumpWidget(
      MyApp(
        persistenceService: persistenceService,
      ),
    );
    await tester.pumpAndSettle();

    // 10. Verify we are redirected straight to GameScreen
    expect(find.text('What is Dart primarily used for?'), findsOneWidget);
  });
}
