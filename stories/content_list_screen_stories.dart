import 'package:flutter/material.dart';
import '../lib/content_list/content_list_screen.dart';

final defaultTitle = 'Browse usage categories';

// ignore_for_file: non_constant_identifier_names
Widget empty_list() => ContentListScreen(
      categories: [],
      title: defaultTitle,
    );

Widget example_list() => ContentListScreen(
      categories: [
        Category(label: 'Provider'),
        Category(label: 'Bloc'),
      ],
      title: defaultTitle,
    );
