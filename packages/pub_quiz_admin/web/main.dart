import 'package:jaspr/browser.dart';
import 'package:pub_quiz_admin/app.dart';
import 'package:pub_quiz_admin/components/db.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_shared/urls.dart';

void main() {
  final client = Client(serverUrl);

  runApp(
    DbProvider(
      child: const App(),
      db: client,
    ),
  );
}
