/// Monarch Themes Documentation:
/// https://monarchapp.io/docs/themes

import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';

@MonarchTheme('Monarch Theme')
ThemeData get monarchTheme => ThemeData.dark().copyWith(
    primaryColor: monarchPrimaryColor,
    colorScheme:
        ThemeData.dark().colorScheme.copyWith(secondary: monarchAccentColor),
    scaffoldBackgroundColor: monarchBackgroundColor,
    textTheme: TextTheme(
        headlineSmall: TextStyle(
            color: monarchPrimaryColor,
            fontSize: 34.0,
            fontWeight: FontWeight.w600),
        titleLarge: TextStyle(
            color: monarchPrimaryColor,
            fontSize: 26,
            fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(
            color: monarchTextColor, fontSize: 20, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            color: monarchTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500)));

const monarchPrimaryColor = Color(0xff00b3b8);
const monarchAccentColor = Color(0xff00c5ca);
const monarchBackgroundColor = Color(0xff2c2c32);
const monarchTextColor = Color(0xfff5f6f7);
