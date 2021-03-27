/// Monarch Themes Documentation: 
/// https://monarchapp.io/docs/themes

import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';


@MonarchTheme('Monarch Theme')
final monarchTheme = ThemeData.dark().copyWith(
  primaryColor: monarchPrimaryColor,
  accentColor: monarchAccentColor,
  scaffoldBackgroundColor: monarchBackgroundColor,
  textTheme: TextTheme(
    headline5: TextStyle(
        color: monarchPrimaryColor,
        fontSize: 34.0,
        fontWeight: FontWeight.w600),
    headline6: TextStyle(
        color: monarchPrimaryColor, fontSize: 26, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(
        color: monarchTextColor, fontSize: 20, fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: monarchTextColor, fontSize: 14, fontWeight: FontWeight.w500)
  )
);

const monarchPrimaryColor = Color(0xff00b3b8);
const monarchAccentColor = Color(0xff00c5ca);
const monarchBackgroundColor = Color(0xff2c2c32);
const monarchTextColor = Color(0xfff5f6f7);