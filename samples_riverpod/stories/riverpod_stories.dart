import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samples_riverpod/hello_world.dart';

ProviderScope providerOverride(
        {required String value, required Widget child}) =>
    ProviderScope(
        overrides: [helloWorldProvider.overrideWithValue(value)], child: child);

Widget hello() => providerOverride(value: 'Hello', child: const HelloWorld());

Widget foo() => providerOverride(value: 'foo', child: const HelloWorld());

Widget bar() => providerOverride(value: 'bar', child: const HelloWorld());
