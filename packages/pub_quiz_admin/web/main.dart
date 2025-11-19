import 'package:jaspr/browser.dart';
import 'package:pub_quiz_admin/app.dart';
import 'package:pub_quiz_admin/components/db.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

void main() {
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl = serverUrlFromEnv.isEmpty
      // ? 'https://api.pubquiz.space/'
      ? 'http://localhost:8088/'
      : serverUrlFromEnv;

  final client = Client(serverUrl);

  runApp(
    DbProvider(
      child: const App(),
      db: client,
    ),
  );
}
