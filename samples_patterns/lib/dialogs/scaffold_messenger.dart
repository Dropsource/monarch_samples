import 'package:flutter/material.dart';

/// Flutter code sample for [ScaffoldMessenger].

class ScaffoldMessengerExampleApp extends StatelessWidget {
  const ScaffoldMessengerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ScaffoldMessenger Sample')),
        body: const Center(
          child: ScaffoldMessengerExample(),
        ),
      ),
    );
  }
}

class ScaffoldMessengerExample extends StatelessWidget {
  const ScaffoldMessengerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A SnackBar has been shown.'),
          ),
        );
      },
      child: const Text('Show SnackBar'),
    );
  }
}
