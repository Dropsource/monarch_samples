import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../stories/statefull_widget_obscured_text_input_stories.dart';

void main() {
  testWidgets('Should display reveal password icon when text obscure is true',
      (WidgetTester tester) async {
    // Build widget imported from story
    await tester.pumpWidget(obscured_text_input_no_text());

    // Verify that correct icon is displayed.
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsNothing);
  });

  testWidgets('Should display obscure password icon when text obscure is false',
      (WidgetTester tester) async {
    // Build widget imported from story
    await tester.pumpWidget(viewable_obscured_text_input_no_text());

    // Verify that correct icon is displayed.
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsNothing);
  });

  testWidgets('Clicking on reveal/obscure password should toggle mode',
      (WidgetTester tester) async {
    // Build widget imported from story
    await tester.pumpWidget(obscured_text_input_no_text());

    //we start with obscured text field
    //let's tap on the reveal icon to make it viewable
    await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));

    //wait for the widget rebuild
    await tester.pump(Duration(milliseconds: 200));

    // Verify that obscure text icon is visible
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsNothing);

    //now let's obscure it again by clicking the eye icon
    await tester.tap(find.byIcon(Icons.remove_red_eye));
    //wait for the widget rebuild
    await tester.pump(Duration(milliseconds: 200));

    // Verify that view text icon is visible again
    expect(find.byIcon(Icons.remove_red_eye), findsNothing);
    expect(find.byIcon(Icons.remove_red_eye_outlined), findsOneWidget);
  });
}
