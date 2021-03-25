import 'package:flutter/material.dart';
import 'package:monarch_samples/content_list/content_list_screen.dart';

final defaultTitle = 'Browse usage categories';
// ignore: non_constant_identifier_names
Widget empty_list() => ContentListScreen(
      categories: [],
      title: defaultTitle,
    );

// ignore: non_constant_identifier_names
Widget example_list() => ContentListScreen(
      categories: [
        Category(label: 'Provider'),
        Category(label: 'Bloc'),
      ],
      title: defaultTitle,
    );
