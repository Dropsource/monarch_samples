import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samples_riverpod/hello_world.dart';

void main() {
  runApp(
    ProviderScope(
      child: Scaffold(
          appBar: AppBar(title: const Text('Monarch + Riverpod Example')),
          body: const HelloWorld()),
    ),
  );
}
