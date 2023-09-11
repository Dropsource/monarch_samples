// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:monarch_samples_pretty/main.dart';
import 'package:monarch_samples_pretty/src/design_course/course_info_screen.dart';
import 'package:monarch_samples_pretty/src/design_course/home_design_course.dart';
import 'package:monarch_samples_pretty/src/design_course/models/course.dart';

import '../stories/design_course_stories.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });



  testWidgets('Has Favorite button', (WidgetTester tester) async {

    Widget screen = details_active();

    await tester.pumpWidget(screen);

    expect(find.byIcon(Icons.favorite), findsOneWidget);

  });






}
