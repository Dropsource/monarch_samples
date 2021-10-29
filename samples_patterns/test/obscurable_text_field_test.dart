import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../stories/obscurable_text_field_stories.dart' as stories;

void main() {
  testWidgets('Should display reveal password icon when text obscure is true',
      (WidgetTester tester) async {
    // Build widget imported from story
    await tester.pumpWidget(materializeTextField(stories.obscured_text));

    // Verify that correct icon is displayed.
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsNothing);

    // Verify underlying TextField is set to obscure text
    final finder = find.byType(TextField);
    final input = tester.firstWidget<TextField>(finder);
    expect(input.obscureText, true);
  });

  testWidgets('Should display obscure password icon when text obscure is false',
      (WidgetTester tester) async {
    // Build widget imported from story
    await tester.pumpWidget(materializeTextField(stories.clear_text));

    // Verify that correct icon is displayed.
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsNothing);

    // Verify underlying TextField is set to clear text
    final finder = find.byType(TextField);
    final input = tester.firstWidget<TextField>(finder);
    expect(input.obscureText, false);
  });

  testWidgets('Clicking on reveal/obscure icon should toggle obscure text',
      (WidgetTester tester) async {
    // Build widget imported from story, we start with obscured text field
    await tester.pumpWidget(materializeTextField(stories.obscured_text));

    // Let's tap on the reveal icon to make it viewable
    await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));

    await tester.pump(Duration(milliseconds: 200));

    // Verify that obscure text icon is visible and text is clear
    {
      expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
      final finder = find.byType(TextField);
      final input = tester.firstWidget<TextField>(finder);
      expect(input.obscureText, false);
    }

    // Now let's obscure it again by clicking the eye icon
    await tester.tap(find.byIcon(Icons.remove_red_eye));

    await tester.pump(Duration(milliseconds: 200));

    // Verify reveal icon shows and text is obscured
    {
      expect(find.byIcon(Icons.remove_red_eye_outlined), findsOneWidget);
      final finder = find.byType(TextField);
      final input = tester.firstWidget<TextField>(finder);
      expect(input.obscureText, true);
    }
  });
}

/// TextField widgets require a Material widget ancestor. Monarch automatically
/// adds the required ancestor. Tests run outside of Monarch thus we need to
/// add the Material widget ancestor here.
MaterialApp materializeTextField(Widget Function() story) => MaterialApp(
      home: Scaffold(body: story()),
    );
