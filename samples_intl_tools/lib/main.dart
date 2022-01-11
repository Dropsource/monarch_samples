import 'package:flutter/material.dart';
import 'package:monarch_samples_intl_tools/hello_world.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monarch intl tools sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HelloWorld(),
    );
  }
}
