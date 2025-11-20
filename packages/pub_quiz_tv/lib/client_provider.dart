import 'package:flutter/widgets.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

class ClientProvider extends InheritedWidget {
  ClientProvider({super.key, required this.client, required super.child});

  final Client client;

  static Client of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ClientProvider>()!.client;
  }

  @override
  bool updateShouldNotify(ClientProvider oldWidget) {
    return oldWidget.client != client;
  }
}
