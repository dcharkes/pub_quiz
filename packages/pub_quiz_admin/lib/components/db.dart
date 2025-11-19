import 'package:jaspr/jaspr.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

class DbProvider extends InheritedComponent {
  const DbProvider({
    required this.db,
    required super.child,
    super.key,
  });

  final Client db;

  static Client of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<DbProvider>()!.db;
  }

  @override
  bool updateShouldNotify(covariant DbProvider oldComponent) {
    return oldComponent.db != db;
  }
}
