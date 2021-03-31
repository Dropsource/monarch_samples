import 'package:flutter/material.dart';
import 'package:monarch_samples/statefull_widget/obscured_single_value_text_field.dart';

Widget obscured_text_input_no_text() =>
    materializeWidget(ObscuredSingleValueTextfield());

Widget obscured_text_input_with_text() =>
    materializeWidget(ObscuredSingleValueTextfield(
      value: 'Hidden password',
    ));

Widget viewable_obscured_text_input_no_text() =>
    materializeWidget(ObscuredSingleValueTextfield(
      obscureText: false,
    ));

Widget viewable_obscured_text_input_with_text() =>
    materializeWidget(ObscuredSingleValueTextfield(
      value: 'Revealed password',
      obscureText: false,
    ));

//adds material app and scaffold so Flutter widget tests can pump and verify component inside
MaterialApp materializeWidget(Widget child) => MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
