import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnterGameIdScreen extends StatefulWidget {
  const EnterGameIdScreen({super.key});

  @override
  State<EnterGameIdScreen> createState() => _EnterGameIdScreenState();
}

class _EnterGameIdScreenState extends State<EnterGameIdScreen> {
  final _controller = TextEditingController();

  void _submit() {
    final gameId = _controller.text.trim();
    if (gameId.isNotEmpty) {
      context.go('/$gameId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Game ID')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Game ID',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _submit,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
