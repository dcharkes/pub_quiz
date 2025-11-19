import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pub_quiz_player/main.dart';
import 'package:pub_quiz_player/src/services/persistence_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Full Join Game Flow Test', (WidgetTester tester) async {
    // 1. Setup Mock SharedPreferences and FakeFirestore
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final persistenceService = PersistenceService(prefs);
    final firestore = FakeFirebaseFirestore();

    // 2. Start App
    await tester.pumpWidget(
      MyApp(
        persistenceService: persistenceService,
        firestore: firestore,
      ),
    );
    await tester.pumpAndSettle();

    // 3. Verify we are on EnterGameIdScreen
    expect(find.text('Enter Game ID'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // 4. Enter Game ID and Submit
    await tester.enterText(find.byType(TextField), 'test-game');
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // 5. Verify we are on JoinGameScreen
    expect(find.text('Join Game: test-game'), findsOneWidget);
    expect(find.text('Your Name'), findsOneWidget);

    // 6. Enter Name and Join
    await tester.enterText(find.byType(TextField), 'Player1');
    await tester.tap(find.text('Join'));
    await tester.pumpAndSettle();

    // 7. Verify we are on GameScreen
    expect(find.text('Welcome, Player1!'), findsOneWidget);
    expect(find.text('Game ID: test-game'), findsOneWidget);

    // 8. Verify Persistence
    expect(persistenceService.savedGameId, 'test-game');
    expect(persistenceService.savedPlayerName, 'Player1');

    // 9. Restart App (Simulate Refresh)
    // We need to rebuild the app with the same persistence service
    // (which now has data)
    await tester.pumpWidget(
      MyApp(
        persistenceService: persistenceService,
        firestore: firestore,
      ),
    );
    await tester.pumpAndSettle();

    // 10. Verify we are redirected straight to GameScreen
    expect(find.text('Welcome, Player1!'), findsOneWidget);
  });
}
