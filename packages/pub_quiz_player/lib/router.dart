import 'package:go_router/go_router.dart';
import 'src/screens/enter_game_id_screen.dart';
import 'src/screens/game_or_join_screen.dart';
import 'src/services/persistence_service.dart';

GoRouter createRouter(PersistenceService persistenceService) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: persistenceService,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const EnterGameIdScreen(),
        redirect: (context, state) {
          final savedGameId = persistenceService.savedGameId;
          if (savedGameId != null && savedGameId.isNotEmpty) {
            return '/$savedGameId';
          }
          return null;
        },
      ),
      GoRoute(
        path: '/:gameId',
        builder: (context, state) {
          final gameId = state.pathParameters['gameId']!;
          return GameOrJoinScreen(
            gameId: gameId,
            persistenceService: persistenceService,
          );
        },
      ),
    ],
  );
}
