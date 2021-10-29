import 'package:flutter/material.dart';
import 'package:monarch_samples/text_fields/obscurable_text_field.dart';

Widget obscured_text() => ObscurableTextfield(
      value: 'P@ssw0rd!',
    );

Widget clear_text() => ObscurableTextfield(
      value: 'P@ssw0rd!',
      obscureText: false,
    );

Widget empty_text() => ObscurableTextfield();
