import 'package:jaspr/browser.dart';
import 'package:pub_quiz_admin/app.dart';
import 'package:pub_quiz_admin/components/db.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

void main() {
  const serverUrlFromEnv = String.fromEnvironment(
    'SERVERPOD_API_SERVER_PUBLIC_HOST',
  );
  final serverUrl = serverUrlFromEnv.isEmpty
      ? 'http://localhost:8088/'
      : 'https://$serverUrlFromEnv/';

  final client = Client(serverUrl);

  runApp(
    DbProvider(
      child: const App(),
      db: client,
    ),
  );
}
