// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:monarch_samples_patterns/content_list/content_list_screen.dart';

final defaultTitle = 'Browse groceries categories';

Widget empty_list() => ContentListScreen(
      categories: [],
      title: defaultTitle,
    );

Widget populated_list() => ContentListScreen(
      categories: [
        Category(label: 'Produce'),
        Category(label: 'Bakery'),
        Category(label: 'Canned Goods'),
      ],
      title: defaultTitle,
    );
