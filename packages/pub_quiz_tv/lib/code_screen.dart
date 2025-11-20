import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PubQuizLogo(
              fontSize: screenWidth / 10,
            ),
            SizedBox(
              width: screenWidth / 4,
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Game PIN'),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      context.go('/game/${_controller.text}');
                    },
                    child: const Text('Join'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
